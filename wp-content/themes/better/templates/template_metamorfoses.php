<?php

/**
 * Template Name: Metamorfoses
 * 
 * 
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package K5
 */

global $post; 

get_header(); 

    $args_list = array(
        'post_type' => 'metamorphoses',  // Typ wpisu 'project'
        'post_status' => 'publish', // Tylko opublikowane wpisy
        'posts_per_page' => -1, 
    );

    $metamorphoses = new WP_Query($args_list);



    $current_page = $post;

    $kolor_tla_naglowka = get_field('kolor_tla_naglowka', $current_page->ID);
    $kolor_tla_ = get_field('kolor_tla_', $current_page->ID);

?>

    <section class="metamorphoses">
        <div class="content-header <?=$kolor_tla_naglowka?>" data-waypoint-header="<?=get_header_color($kolor_tla_naglowka)?>">
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
        <div class="content-list <?=$kolor_tla_?>" data-waypoint-header="<?=get_header_color($kolor_tla_)?>">
            <div class="container">
                <div class="row d-none">
                    <div class="col-12">
                        <div id="filter">
                            <span class="label"><?=__('Filtruj', 'better')?></span>
                            <select name="doctor" placeholder="<?=__('Lekarz', 'better')?>">
                                <option value=""></option>
                                <option value=""></option>
                                <option value=""></option>
                            </select>
                            <select name="spec" placeholder="<?=__('Specjalizacja', 'better')?>">
                                <option value=""></option>
                                <option value=""></option>
                                <option value=""></option>
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <?php if ($metamorphoses->have_posts()) : ?>
                        <div class="col-md-6 d-none d-md-block" data-waypoint-animate="true">
                        <?php $index = 0; while ($metamorphoses->have_posts()) : 
                                    $metamorphoses->the_post(); 
                                    $service = $post; 
                                    if($index%2 == 0):
                                    ?>
                                        <?php get_template_part( 'template-parts/content', 'metamorphose-item', $service);?>
                                        <?php endif; $index++; endwhile; ?>
                                    </div>

                                    <div class="col-md-6 d-none d-md-block" data-waypoint-animate="true">
                        <?php $index = 0; while ($metamorphoses->have_posts()) : 
                                    $metamorphoses->the_post(); 
                                    $service = $post; 
                                    if($index%2 == 1):
                                    ?>
                                        <?php get_template_part( 'template-parts/content', 'metamorphose-item', $service);?>
                                        <?php endif; $index++; endwhile; ?>
                                    </div>

                                    <div class="col d-block d-md-none" data-waypoint-animate="true">
                        <?php $index = 0; while ($metamorphoses->have_posts()) : 
                                    $metamorphoses->the_post(); 
                                    $service = $post; 
                                    ?>
                                        <?php get_template_part( 'template-parts/content', 'metamorphose-item', $service);?>
                                        <?php $index++; endwhile; ?>
                                    </div>
                            <?php endif; ?>
                    </div>
                </div>
        </div>

    </section>

    <?php 
        get_template_part( 'template-parts/template', 'seo2');
    ?>

    <?php 
        $mainpage_item = get_post_by_slug_and_type('uslugi', 'mainpage');
        get_template_part( 'template-parts/template', 'services', $mainpage_item);
    ?>

    <?php 
        $mainpage_item = get_post_by_slug_and_type('kontakt', 'mainpage');
        get_template_part( 'template-parts/template', 'contact', $mainpage_item);
    ?>



<?php
get_footer();
