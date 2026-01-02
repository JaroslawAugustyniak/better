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
        'posts_per_page' => -1      // Pobierz wszystkie wpisy
    );

    $mainpage = new WP_Query($mainpage_args_list);
    if ($mainpage->have_posts()) : 
        while ($mainpage->have_posts()) : $mainpage->the_post(); $mainpage_item = $post;

        $element_type = get_field('element', $mainpage_item->ID);

        if($element_type) get_template_part( 'template-parts/template', $element_type, $mainpage_item);

        endwhile;
    endif;
?>


<?php
get_footer();
