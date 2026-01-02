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
                        <div class="content-header__title" data-waypoint-animate="true">
                            <h1 class="head-class"><?=$current_page->post_title?></h1>
                        </div>

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

        <div class="content-list">
            <?php if ($services->have_posts()) : ?>
                <?php $index = 0; while ($services->have_posts()) : 
                    $services->the_post(); 
                    $service = $post; 
                    $service_title = get_field('service_title');
                    $service_content = get_field('opis_uslugi_w_listach');
                ?>
                <article class="content-list__item <?=$index%2 != 0 ? 'colorset--color-5' : 'colorset--color-2'?>" data-waypoint-header="<?=$index%2 == 0 ? 'page-header--color-5' : '}page-header--color-2'?>">

                    <div class="container">
                        <div class="row flex-lg-row-reverse align-items-lg-end justify-content-lg-between">
                            <div class="col-lg-7 col-12">
                                <div class="content-list__item-image homepage-section__baners-item" data-waypoint-animate="true">
                                    
                                    <figure class="fill-box">
                                        <?php
                                            displayImage($service->ID);
                                        ?>
                                    </figure>
                                    
                                </div>
                            </div>

                           
        


                            <div class="col-lg-4 col-lg-5 col-md-9 col-12">
                                <div class="content-list__item-info">
                                    <div class="content-list__item-title homepage-section__title" data-waypoint-animate="true">
                                        <h2 class="head-class"><?=$service_title?></h2>
                                    </div>
                                    <div class="content-list__item-dsc homepage-section__dsc" data-waypoint-animate="true">
                                        <?=$service_content?>
                                    </div>
                                    <div class="content-list__item-buttons homepage-section__buttons" data-waypoint-animate="true">
                                        <a href="<?=get_permalink($service->ID)?>" class="button"><?=__('Dowiedz sie więcej', 'better')?></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
                <?php $index++; endwhile; ?>
            <?php endif; ?>
        </div>

    </section>


<?php
get_footer();
