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

    $page = get_post_by_slug_and_type('uslugi', 'page');

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
                
                <div id="newsCarousel" class="news-carousel slickSlider display_dots slick_nav nav_inside" slick_per_page="2_2_1_1" slick_show_dots="0" slick_hide_arrows="0" fade="0">    
                    <?php $index = 0; while ($magazyn->have_posts()) : 
                        $magazyn->the_post(); 
                        $item = $post; 
                        $krotki_opis = get_field('krotki_opis');
                        $naglowek = get_field('naglowek');

                    ?>
                        <div class="news-slide" 
                             data-index="<?= $index ?>" 
                             data-news-id="<?=$item->ID?>" 
                             data-title="<?=$item->post_title?>"
                             data-url="<?=get_permalink($item->ID)?>">
                            
                            <a href="<?=get_permalink($item->ID)?>" class="news-card">
                                <div class="news-image-container">
                                    <?php displayImage($item->ID); ?>
                                </div>
                                
                                <div class="news-content">
                                    <h3 class="news-title"><?=$naglowek ? $naglowek : $item->post_title?></h3>
                                    <div class="news-excerpt"><?=$krotki_opis?></div>
                                    
                                    <div class="news-meta">                                        
                                        <span class="button">
                                            <?=__('Czytaj więcej', 'better')?>                                            
                                        </span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    <?php $index++; endwhile; ?>
                </div>
                
                
      
            </div>
            

        </div>
    </section>

<?php endif; ?>