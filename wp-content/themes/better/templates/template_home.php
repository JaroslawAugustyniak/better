<?php

/**
 * Template Name: Homepage
 * 
 * 
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package K5
 */
global $page;

get_header(); 
?>

<?php get_template_part( 'template-parts/template', 'slider');?>
<?php 
    $mainpage_args_list = array(
        'post_type' => 'mainpage',  // Typ wpisu 'project'
        'post_status' => 'publish', // Tylko opublikowane wpisy
        'posts_per_page' => -1,      // Pobierz wszystkie wpisy
        'meta_query' => array(
            'relation' => 'OR',
            array(
                'key' => 'pokaz_na_stronie_glownej',
                'value' => 1,
                'compare' => '='
            ),
            
        )
    );

    
    $mainpage = new WP_Query($mainpage_args_list);
    if ($mainpage->have_posts()) : 
        while ($mainpage->have_posts()) : $mainpage->the_post(); $mainpage_item = $post;

        wp_reset_postdata();
        $element_type = get_field('element', $mainpage_item->ID);
        // echo $element_type;     
        // && ($element_type=='metamorf' || $element_type=='opinions' || $element_type=='videos' || $element_type=='services')
        if($element_type) get_template_part( 'template-parts/template', $element_type, $mainpage_item);

        endwhile;
    endif;
?>


<?php
get_footer();
