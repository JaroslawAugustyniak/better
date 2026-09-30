<?php
/**
 * Plugin Name: Better – Rank Math: treść strony głównej
 * Description: Dodaje do analizy Rank Math treść strony głównej: slider i sekcje (template-parts) renderowane przez szablon Homepage.
 * Version: 1.2.0
 * Author: Jarosław Augustyniak
 */

defined( 'ABSPATH' ) || exit;

const BETTER_RM_HOME_TEMPLATE = 'templates/template_home.php';

/**
 * Renderuje te same template-parts co templates/template_home.php
 * (slider + sekcje wg pola ACF "element" wpisów mainpage) i zwraca oczyszczony HTML.
 */
function better_rm_home_content() {
    static $cache = null;
    if ( null !== $cache ) {
        return $cache;
    }

    global $post;
    $original_post = $post;

    $query = new WP_Query( array(
        'post_type'      => 'mainpage',
        'post_status'    => 'publish',
        'posts_per_page' => -1,
        'meta_query'     => array(
            array(
                'key'     => 'pokaz_na_stronie_glownej',
                'value'   => 1,
                'compare' => '=',
            ),
        ),
    ) );

    $parts = array( array( 'slider', null ) );
    foreach ( $query->posts as $item ) {
        $element_type = function_exists( 'get_field' ) ? get_field( 'element', $item->ID ) : '';
        if ( $element_type ) {
            $parts[] = array( $element_type, $item );
        }
    }

    $html = '';
    foreach ( $parts as $part ) {
        ob_start();
        try {
            get_template_part( 'template-parts/template', $part[0], $part[1] );
        } catch ( \Throwable $e ) {
            // Pomijamy sekcję, która nie renderuje się w panelu.
        }
        $html .= ob_get_clean();

        // Szablony wołają the_post() – przywracamy edytowany wpis.
        $post = $original_post;
        setup_postdata( $post );
    }

    // Usuń elementy niezawierające treści tekstowej.
    $html = preg_replace( '#<(script|style|svg|noscript|iframe|template)\b[^>]*>.*?</\1>#is', '', $html );
    $html = wp_kses_post( $html );
    $html = preg_replace( '/(\s*\n\s*){2,}/', "\n", $html );

    $cache = trim( $html );
    return $cache;
}

add_action( 'admin_enqueue_scripts', function ( $hook ) {
    if ( ! in_array( $hook, array( 'post.php', 'post-new.php' ), true ) ) {
        return;
    }

    $post = get_post();
    if ( ! $post || 'page' !== $post->post_type
        || BETTER_RM_HOME_TEMPLATE !== get_page_template_slug( $post ) ) {
        return;
    }

    $html = better_rm_home_content();
    if ( '' === $html ) {
        return;
    }

    wp_add_inline_script(
        'wp-hooks',
        'wp.hooks.addFilter("rank_math_content","better/home",function(content){return content+' . wp_json_encode( $html ) . ';});'
    );
} );

// Podgląd (tylko do odczytu) treści widzianej przez Rank Math, pod edytorem strony.
add_action( 'add_meta_boxes_page', function ( $post ) {
    if ( BETTER_RM_HOME_TEMPLATE !== get_page_template_slug( $post ) ) {
        return;
    }

    add_meta_box(
        'better-rm-home-preview',
        'Treść strony głównej widoczna dla Rank Math (podgląd)',
        function () {
            $html = better_rm_home_content();
            echo '<p class="description">Tylko do odczytu. Treść pochodzi z renderowanych sekcji strony (template-parts: slider, opinie, filmy, zespół itd.) i jest dołączana do analizy Rank Math. Edytuj ją w odpowiednich wpisach CPT.</p>';
            echo '<div style="max-height:400px;overflow:auto;padding:0 12px;border:1px solid #dcdcde;background:#fff">';
            echo '' !== $html ? $html : '<p><em>Brak treści do wyświetlenia.</em></p>';
            echo '</div>';
        },
        'page',
        'normal',
        'default'
    );
} );
