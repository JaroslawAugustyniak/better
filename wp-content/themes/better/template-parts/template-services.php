<?php 
    $mainpage_item = $args;  
    // Użyj WP_Query, aby pobrać opublikowane wpisy typu 'project'
    $args_list = array(
        'post_type'      => 'service',   // typ wpisu
        'post_status'    => 'publish',   // tylko opublikowane
        'posts_per_page' => -1,          // wszystkie
        'post_parent'    => 0            // tylko wpisy bez parenta
    );

    $services = new WP_Query($args_list);

    $page = get_post_by_slug_and_type('uslugi', 'page');

    $bg = get_field('kolor_tla', $mainpage_item->ID);
    $description = get_field('opis', $mainpage_item->ID);

?>
<?php if ($services->have_posts()) : ?>
<section class="homepage-section services section <?=$bg?>" data-waypoint-header="<?=get_header_color($bg)?>">
    <div class="container">
        <div class="homepage-section__top">
            <div class="row">
                <div class="col-lg-4 col-12">
                    <div data-waypoint-animate="true">
                        <h2 class="homepage-section__header">
                            <a href="<?=get_permalink($page->ID)?>"><?=$mainpage_item->post_title?></a>
                        </h2>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="homepage-section__description" data-waypoint-animate="true"><?=$description?></div>
                </div>
            </div>
        </div>

        <div id="services"  data-waypoint-animate="true" class="slider-template-header slickSlider display_dots slick_nav nav_inside" slick_per_page="3_3_2_1" slick_show_dots="0" slick_hide_arrows="0" fade="0">   
                

                     <?php $index = 0; while ($services->have_posts()) : 
                        $services->the_post(); 
                        $service = $post; 
                        
                    ?>

                            
                            <div class="slide">
                                <?php get_template_part( 'template-parts/content', 'service-item', $service);?>
                            </div>

                            <?php
                            $index++; 
                        endwhile; 

                        wp_reset_postdata();
                    

                ?>

            </div>
            <div class="homepage-sercions__bottom" data-waypoint-animate="true">
                <a href="<?=get_permalink($page->ID)?>" class="button"><?=__('Zobacz wszystkie', 'better')?></a>
            </div>
        
    </div>
</section>
<?php endif; ?>