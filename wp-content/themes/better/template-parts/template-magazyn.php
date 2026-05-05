<?php 
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

    $mainpage_item = $args; 
    $opis = get_field('opis', $mainpage_item->ID);
?>
<?php if ($magazyn->have_posts()) : ?>

    <section class="homepage-section news-section colorset--color-1" data-waypoint-header="page-header--color-1">
        <div class="container">
            <div class="section-header text-center" data-waypoint-animate="true">
                <h2 class="section-title"><?= $mainpage_item->post_title ?></h2>
                <p class="section-subtitle"><?= $opis ?></p>
            </div>
            
            <div class="news-carousel-container" data-waypoint-animate="true">
                <div class="news-carousel" id="newsCarousel">
                    <?php $index = 0; while ($magazyn->have_posts()) : 
                        $magazyn->the_post(); 
                        $item = $post; 
                        $krotki_opis = get_field('krotki_opis');
                        $naglowek = get_field('naglowek');

                        $tresc_preview = substr(strip_tags($krotki_opis), 0, 150) . '...';
                    ?>
                        <div class="news-slide" 
                             data-index="<?= $index ?>" 
                             data-news-id="<?=$item->ID?>" 
                             data-title="<?=$item->post_title?>"
                             data-url="<?=get_permalink($item->ID)?>">
                            
                            <a href="<?=get_permalink($item->ID)?>" class="news-card">
                                <div class="news-image-container">
                                    <?php displayImage($item->ID); ?>
                                    

                                    <div class="news-date-badge">
                                        <span class="date-day"><?= get_the_date('d') ?> </span>
                                        <span class="date-month"><?= get_the_date('m') ?></span>
                                    </div>
                                    
                                </div>
                                
                                <div class="news-content">
                                    <h3 class="news-title"><?=$naglowek ? $naglowek : $item->post_title?></h3>
                                    <p class="news-excerpt"><?=$tresc_preview?></p>
                                    
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