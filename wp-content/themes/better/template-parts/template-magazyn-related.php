<?php
    // Pobierz tagi bieżącego wpisu
    
    $current_post_id = get_the_ID();
    $current_tags = get_the_tags();
    
    // Jeśli wpis ma tagi, pobierz ich ID
    $tag_ids = array();
    if ($current_tags && !is_wp_error($current_tags)) {
        $tag_ids = wp_list_pluck($current_tags, 'term_id');
    }


    // Zapytanie pobierające wpisy z tymi samymi tagami
    $args_list = array(
        'post_type'      => 'magazyn',
        'post_status'    => 'publish',
        'posts_per_page' => -1,
        'post__not_in'   => array($current_post_id), // Wyłącz bieżący wpis
    );

    // Jeśli wpis ma tagi, dodaj tax_query
    if (!empty($tag_ids)) {
        $args_list['tax_query'] = array(
            array(
                'taxonomy' => 'post_tag',
                'field'    => 'term_id',
                'terms'    => $tag_ids,
                'operator' => 'IN', // Pobierz wpisy które mają KTÓRYKOLWIEK z tych tagów
            ),
        );
    }

    $magazyn = new WP_Query( $args_list );

    $bg = 'colorset--color-3';
?>
<?php if ($magazyn->have_posts()) : ?>

    <section id="magazyn" class="homepage-section news-section <?=$bg?>" data-waypoint-header="<?=get_header_color($bg)?>">
        <div class="container">
                <div class="homepage-section__top">
                    <div class="row">
                        <div class="col-lg-4 col-12">
                            <div data-waypoint-animate="true">
                                <p class="homepage-section__header">
                                    <?= __('Czytaj dalej', 'better')?>
                                </p>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            
                        </div>
                    </div>
                </div>
            
            <div class="news-carousel-container" data-waypoint-animate="true">
                
                <div id="newsCarousel" auto_play="1" speed="6000" class="news-carousel slickSlider display_dots slick_nav nav_inside" slick_per_page="2_2_1_1" slick_show_dots="0" slick_hide_arrows="0" fade="0">    
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