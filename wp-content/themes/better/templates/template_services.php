<?php

/**
 * Template Name: Services
 * 
 * 
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package K5
 */
global $page;

get_header(); 

    $args_list = array(
        'post_type' => 'service',  // Typ wpisu 'project'
        'post_status' => 'publish', // Tylko opublikowane wpisy
        'posts_per_page' => -1,      // Pobierz wszystkie wpisy
        'post_parent'    => 0 
    );

    $services = new WP_Query($args_list);

    global $post; 


    $current_page = $post;

?>

    <section class="">
        <div class="content-header colorset--color-5" data-waypoint-header="page-header--color-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-6 col-lg-8 col-md-9 col-sm-10 col-xs-11 col-12">
                        <?php if (function_exists("rank_math_the_breadcrumbs")) rank_math_the_breadcrumbs(); ?>

                        <div class="content-header__dsc" data-waypoint-animate="true">
                            <?php 
                            $content = $current_page->post_content;
                            $content = apply_filters( 'the_content', $content );
                            $content = str_replace( ']]>', ']]&gt;', $content );
                            echo $content;
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="services" class="content-list colorset--color-5" data-waypoint-header="page-header--color-5">
            <div class="container">
                <div class="row">
                    <?php if ($services->have_posts()) : ?>
                        <?php $index = 0; while ($services->have_posts()) : 
                                    $services->the_post(); 
                                    $service = $post; 
                                    $service_title = get_field('service_title');
                                    $service_content = get_field('opis_uslugi_w_listach');
                                    
                                    
                                    
                                    ?>
                                    <div class="col-md-4" data-waypoint-animate="true">
                                        <?php get_template_part( 'template-parts/content', 'service-item', $service);?>
                                    </div>
                                <?php $index++; endwhile; ?>
                            <?php endif; ?>
                    </div>
                </div>
        </div>

    </section>

    <?php 
        get_template_part( 'template-parts/template', 'seo2');
    ?>

    <?php 
        $mainpage_item = get_post_by_slug_and_type('kontakt', 'mainpage');
        get_template_part( 'template-parts/template', 'contact', $mainpage_item);
    ?>



<?php
get_footer();
