<?php
/**
 * better functions and definitions
 *
 * @link https://developer.wordpress.org/themes/basics/theme-functions/
 *
 * @package better
 */
add_filter('show_admin_bar', '__return_false');
if ( ! defined( '_S_VERSION' ) ) {
	// Replace the version number of the theme on each release.
	define( '_S_VERSION', '1.0.2' );
}

add_action( 'acf/input/admin_enqueue_scripts', function() {
    if ( function_exists('wp_enqueue_editor') ) {
        wp_enqueue_editor();
    }
});

// Dodaj do functions.php lub własnej wtyczki
add_action( 'admin_menu', function() {
    // Tworzymy główny element menu
    add_menu_page(
        'Better.clinic',         // Tytuł strony
        'Better.clinic',         // Nazwa w menu
        'manage_options',    // Uprawnienia
        'better_main',    // Slug menu
        '',                  // Funkcja (niepotrzebna – tylko kontener)
        'dashicons-portfolio', // Ikona
        20                   // Pozycja
    );
});
/**
 * Sets up theme defaults and registers support for various WordPress features.
 *
 * Note that this function is hooked into the after_setup_theme hook, which
 * runs before the init hook. The init hook is too late for some features, such
 * as indicating support for post thumbnails.
 */


function displayAcfSvg($name, $postId = false){
	
	$field = get_field($name, $postId);

	if($field){
		$fileArr = explode('uploads', $field['url']); 
		$file = isset($fileArr[1]) ? $fileArr[1] : false;


		if($file){
			include (wp_upload_dir()['basedir'].$file);
		}
	}
}

function get_header_color($bg_color){
	switch($bg_color){
		case 'colorset--color-1':
			return 'page-header--color-1';
		case 'colorset--color-2':
			return 'page-header--color-2';
		case 'colorset--color-3':
			return 'page-header--color-3';
		case 'colorset--color-4':
			return 'page-header--color-1';
		case 'colorset--color-5':
			return 'page-header--color-1';
		case 'colorset--color-6':
			return 'page-header--color-1';
		case 'colorset--color-7':
			return 'page-header--color-1';
		case 'colorset--color-8':
			return 'page-header--color-2';
	}
}

function displayImage($post_id, $class=''){
	if (has_post_thumbnail($post_id)) {
                                $thumb_id = get_post_thumbnail_id($post_id);
                                $thumb_url = wp_get_attachment_url($thumb_id);
                                $file_ext = pathinfo($thumb_url, PATHINFO_EXTENSION);

                                // Jeśli plik jest GIFem – pokaż oryginalny obrazek
                                if (strtolower($file_ext) === 'gif') {
                                    echo '<img src="' . esc_url($thumb_url) . '" alt="' . esc_attr(get_the_title($post_id)) . '" class="img-fluid '.$class.'">';
                                } else {
                                    // W przeciwnym razie pokaż obrazek o określonym rozmiarze (np. 'medium', 'large', 'full')
                                    echo get_the_post_thumbnail($post_id, 'full', ['class' => 'img-fluid '.$class]);
                                }
                            }
}

function displayImageACF($image, $alt='', $class=''){
	if ($image) {
		echo '<img src="' . esc_url($image['url']) . '" alt="' . esc_attr($alt) . '" class="img-fluid '.$class.'">';
    }
}

/**
 * Pobiera wpis po slugu i typie wpisu
 *
 * @param string $slug Slug wpisu.
 * @param string $post_type Typ wpisu (np. 'post', 'page', 'places').
 * @return WP_Post|null Zwraca obiekt WP_Post lub null, jeśli nie znaleziono.
 */
function get_post_by_slug_and_type($slug, $post_type = 'post') {
    $post = get_page_by_path($slug, OBJECT, $post_type);

    if ($post instanceof WP_Post) {
        return $post;
    }

    return null;
}

function get_child_posts_of_current( $post = null, $post_type = 'any' ) {
    $post = get_post( $post );
    if ( ! $post ) {
        return array();
    }

    $args = array(
        'post_type'      => $post_type,
        'post_parent'    => $post->ID,
        'posts_per_page' => -1,
        'orderby'        => 'menu_order',
        'order'          => 'ASC',
        'post_status'    => 'publish'
    );

    return get_posts( $args );
}


function split_post_content_by_more( $post = null ) {
    // Pobierz obiekt posta
    $post = get_post( $post );
    if ( ! $post ) {
        return array(
            'before'         => '',
            'after'          => '',
            'after_segments' => array()
        );
    }

    // Pobierz surową treść
    $content = $post->post_content;

    // Podziel według <!--more-->
    $parts = explode( '<!--more-->', $content );

    $before = isset( $parts[0] ) ? $parts[0] : '';
    $after  = isset( $parts[1] ) ? $parts[1] : '';

    // Przepuść przez the_content (shortcody, ACF itd.)
    $before = apply_filters( 'the_content', $before );
    $after  = apply_filters( 'the_content', $after );

    // -----------------------------------------
    // Dodatkowy podział sekcji "after" po <hr>
    // -----------------------------------------

    // Regex dopasuje każdy tag <hr ...>
    $hr_regex = '/<hr\b[^>]*>/i';

    // Podziel sekcję "after" na segmenty
    $segments = preg_split( $hr_regex, $after );

    // Usuń puste elementy (jeśli przed/po hr nic nie ma)
    $segments = array_filter( array_map( 'trim', $segments ) );

    return array(
        'before'         => $before,
        'after'          => $after,
        'after_segments' => array_values( $segments ) // resetuje indeksy
    );
}



function displayAcfSvgFromPath($path){
	
	if($path){
		$fileArr = explode('uploads', $path); 
		$file = isset($fileArr[1]) ? $fileArr[1] : false;


		if($file){
			include (wp_upload_dir()['basedir'].$file);
		}
	}
}

function pr($data){
	echo '<pre>';
	print_r($data);
	echo '</pre>';
}





function better_setup() {
	/*
		* Make theme available for translation.
		* Translations can be filed in the /languages/ directory.
		* If you're building a theme based on better, use a find and replace
		* to change 'better' to the name of your theme in all the template files.
		*/
	load_theme_textdomain( 'better', get_template_directory() . '/languages' );

	// Add default posts and comments RSS feed links to head.
	add_theme_support( 'automatic-feed-links' );

	/*
		* Let WordPress manage the document title.
		* By adding theme support, we declare that this theme does not use a
		* hard-coded <title> tag in the document head, and expect WordPress to
		* provide it for us.
		*/
	add_theme_support( 'title-tag' );

	/*
		* Enable support for Post Thumbnails on posts and pages.
		*
		* @link https://developer.wordpress.org/themes/functionality/featured-images-post-thumbnails/
		*/
	add_theme_support( 'post-thumbnails' );

	// This theme uses wp_nav_menu() in one location.
	register_nav_menus(
		array(
			'menu-1' => esc_html__( 'Primary', 'better' ),
			'footer-1' => esc_html__( 'Footer', 'better' ),			
			'footer-2' => esc_html__( 'Footer 2', 'better' ),			
		)
	);

	/*
		* Switch default core markup for search form, comment form, and comments
		* to output valid HTML5.
		*/
	add_theme_support(
		'html5',
		array(
			'search-form',
			'comment-form',
			'comment-list',
			'gallery',
			'caption',
			'style',
			'script',
		)
	);

	// Set up the WordPress core custom background feature.
	add_theme_support(
		'custom-background',
		apply_filters(
			'better_custom_background_args',
			array(
				'default-color' => 'ffffff',
				'default-image' => '',
			)
		)
	);

	// Add theme support for selective refresh for widgets.
	add_theme_support( 'customize-selective-refresh-widgets' );

	/**
	 * Add support for core custom logo.
	 *
	 * @link https://codex.wordpress.org/Theme_Logo
	 */
	add_theme_support(
		'custom-logo',
		array(
			'height'      => 250,
			'width'       => 250,
			'flex-width'  => true,
			'flex-height' => true,
		)
	);
}
add_action( 'after_setup_theme', 'better_setup' );

/**
 * Set the content width in pixels, based on the theme's design and stylesheet.
 *
 * Priority 0 to make it available to lower priority callbacks.
 *
 * @global int $content_width
 */
function better_content_width() {
	$GLOBALS['content_width'] = apply_filters( 'better_content_width', 640 );
}
add_action( 'after_setup_theme', 'better_content_width', 0 );

/**
 * Register widget area.
 *
 * @link https://developer.wordpress.org/themes/functionality/sidebars/#registering-a-sidebar
 */
function better_widgets_init() {
	register_sidebar(
		array(
			'name'          => esc_html__( 'Sidebar', 'better' ),
			'id'            => 'sidebar-1',
			'description'   => esc_html__( 'Add widgets here.', 'better' ),
			'before_widget' => '<section id="%1$s" class="widget %2$s">',
			'after_widget'  => '</section>',
			'before_title'  => '<h2 class="widget-title">',
			'after_title'   => '</h2>',
		)
	);
}
add_action( 'widgets_init', 'better_widgets_init' );

add_post_type_support( 'page', 'excerpt' );

function mytheme_custom_excerpt_length( $length ) {
    return 20;
}
add_filter( 'excerpt_length', 'mytheme_custom_excerpt_length', 999 );

// define the wpcf7_is_tel callback 
function custom_filter_wpcf7_is_tel( $result, $tel ) { 
	$result = preg_match( '/^\(?\+?([0-9]{1,4})?\)?[-\. ]?(\d{10})$/', $tel );
	return $result; 
  }
  
  add_filter( 'wpcf7_is_tel', 'custom_filter_wpcf7_is_tel', 10, 2 );
/**
 * Enqueue scripts and styles.
 */
function maxString($str, $max){
	if(strlen($str) > $max){
		return substr($str, 0, $max) . '...';	
	}
	return $str;
}

function better_scripts() {
	wp_enqueue_style( 'better-style', get_stylesheet_uri(), array(), _S_VERSION );
	wp_style_add_data( 'better-style', 'rtl', 'replace' );


	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}
	
	// wp_enqueue_style('better-style-style', get_template_directory_uri() . '/assets2/css/style.min.css', array(), _S_VERSION);
	// wp_enqueue_style('better-app-style', get_template_directory_uri() . '/assets2/css/app.min.css', array(), _S_VERSION);

	if($_SERVER['HTTP_HOST'] != 'new.better.localhost'){
		wp_enqueue_script('better-main-js', 'http://new.better.localhost:8080/js/main.min.js', array(), _S_VERSION, true);
	}else{
		wp_enqueue_style('better-main-style', get_template_directory_uri() . '/assets/styles/main.min.css', array(), _S_VERSION);
		wp_enqueue_script('better-main-js', get_template_directory_uri() . '/assets/js/main.min.js', array(), _S_VERSION, true);
	}
}
add_action( 'wp_enqueue_scripts', 'better_scripts' );

function show_posts_by_tags($tag_id, $post_id, $post_per_page, $orderby, $order){

	$args = array( 
        'posts_per_page' => $post_per_page,
        'tax_query'      => array(
            array(
                'taxonomy'  => 'post_tag',
                'field'     => 'slug',
                'terms'     => $tag_id
            )
        )
    );

	$postslist = get_posts( $args );


	if($postslist): ?>
		<div class="related-posts">
			<h2><?=__( 'Related topics', 'better' )?></h2>
				<ul class="news-related-posts">
					<?php
					foreach ($postslist as $recent): ?>
						<li class="news-item">
							<?php get_template_part('template-parts/post', '', $recent);?>
						</li>
					<?php endforeach; ?>
				</ul>
		</div>
	 <?php
	endif;
	
}



// Add Shortcode
function img_shortcode($atts)
{
    // Attributes
    $atts = shortcode_atts(
        [
        'src' => '',
        'link_to_img' => '',
        ], $atts, 'img'
    );

    $return = '';
    if ($atts['link_to_img'] == 'yes')
    {
        $return = '<a href="' . $atts['src'] . '">
                    <img src="' . $atts['src'] . '"/>
                </a>';
    }
    else{
        $return = '<img src="' . $atts['src'] . '"/>';
    }
    // Return HTML code
    return $return;
}

add_shortcode('img', 'img_shortcode');



class Custom_Bootstrap_Menu_Walker extends Walker_Nav_Menu {

    // Otwiera element menu (np. "Klinika")
    function start_el( &$output, $item, $depth = 0, $args = [], $id = 0 ) {

        // Sprawdź, czy ma podmenu
        $has_children = in_array('menu-item-has-children', $item->classes);

        if ($depth === 0) {
            // kolumna na główny element
            $output .= '<div class="col-xxl-2 col-lg-3 col-12">';
            $output .= '<div class="menu-module__headline">';
            $output .= '<a href="' . esc_url($item->url) . '">' . esc_html($item->title) . '</a>';
            $output .= '</div>';

			
            // Opis głównej sekcji
            if (!empty($item->description)) {
				if ( strpos( $item->description, '###dane-adresowe-w-menu###' ) !== false ) {
					$dane_adresowe = get_post_by_slug_and_type('dane-adresowe-w-menu', 'static');
					if ( $dane_adresowe ) {
						$tresc_danych = get_field('tresc', $dane_adresowe->ID);

						

						// Podmień placeholder na faktyczną treść
						$item->description = str_replace(
							'###dane-adresowe-w-menu###',
							$tresc_danych,
							$item->description
						);
					}
				}


                $output .= '<div class="menu-module__block">' . $item->description . '';
            } elseif ($has_children) {
                $output .= '<div class="menu-module__block">';
            }
        }

        if ($depth === 1) {
            // elementy listy w podmenu
            $output .= '<li><a href="' . esc_url($item->url) . '">' . esc_html($item->title) . '</a></li>';
        }
    }

    // Zamknięcie elementu
    function end_el( &$output, $item, $depth = 0, $args = [] ) {
        if ($depth === 0) {
            $output .= '</div></div>'; // zamknij .menu-module__block i kolumnę
        }
    }

    // Otwiera poziom submenu
    function start_lvl( &$output, $depth = 0, $args = [] ) {
        if ($depth === 0) {
            $output .= '<ul>';
        }
    }

    // Zamknięcie poziomu submenu
    function end_lvl( &$output, $depth = 0, $args = [] ) {
        if ($depth === 0) {
            $output .= '</ul>';
        }
    }
}
