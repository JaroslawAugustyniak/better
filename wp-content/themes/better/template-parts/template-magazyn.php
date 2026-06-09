<?php 
    $mainpage_item = $args; 
    // Użyj WP_Query, aby pobrać opublikowane wpisy typu 'project'
    $args_list = array(
        'post_type'      => 'magazyn',
        'post_status'    => 'publish',
        'posts_per_page' => -1,
        'meta_query'     => array(
            array(
                'key'     => 'promuj_na_stronie_glownej',
                'value'   => 1,         // Wartość zaznaczonego checkboxa ACF
                'compare' => '=',       // Porównanie równe
            ),
        ),
    );

    $magazyn = new WP_Query( $args_list );

    $bg = get_field('kolor_tla', $mainpage_item->ID);
    $description = get_field('opis', $mainpage_item->ID);
    
?>
<?php if ($magazyn->have_posts()) : ?>

    <section id="magazyn" class="homepage-section news-section <?=$bg?>" data-waypoint-header="<?=get_header_color($bg)?>">
        <div class="container">
                <div class="homepage-section__top">
                    <div class="row">
                        <div class="col-lg-4 col-12">
                            <div data-waypoint-animate="true">
                                <h2 class="homepage-section__header">
                                    <?=$mainpage_item->post_title?>
                                </h2>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="homepage-section__description" data-waypoint-animate="true"><?=$description?></div>
                        </div>
                    </div>
                </div>
            
            <div class="news-carousel-container" data-waypoint-animate="true">
                
                <div id="newsCarousel" auto_play="1" speed="6000" class="news-carousel slickSlider display_dots slick_nav nav_inside" slick_per_page="2_2_2_1" slick_show_dots="0" slick_hide_arrows="0" fade="0">    
                    <?php $index = 0; while ($magazyn->have_posts()) : 
                        $magazyn->the_post(); 
                        $item = $post; 
                        $item->index = $index;  // Dodaj index
                        $item->showTags = false;
                    ?>
                        <?php get_template_part( 'template-parts/content', 'blog-item', $item);?>
                    <?php $index++; endwhile; wp_reset_postdata(); ?>
                </div>
                
                
      
            </div>
            

        </div>
    </section>

<?php endif; ?>