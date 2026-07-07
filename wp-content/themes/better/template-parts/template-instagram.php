

<?php 
    $mainpage_item = $args; 
    $page = get_post_by_slug_and_type('strona-glowna', 'page');

    
    // Użyj WP_Query, aby pobrać opublikowane wpisy typu 'project'
    // Użyj WP_Query, aby pobrać opublikowane wpisy typu 'project'
    $args_list = array(
        'post_type' => 'instagram',
        'post_status' => 'publish',
        'posts_per_page' => -1,
        // 'meta_query' => array(
        //     array(
        //         'key' => 'strona',
        //         'value' => $page->ID,
        //         'compare' => '='
        //     )
        // )
    );

    $instagram = new WP_Query($args_list);

    

    $bg = get_field('kolor_tla', $mainpage_item->ID);
    $description = get_field('opis_wysiwyg', $mainpage_item->ID);



?>
<?php if ($instagram->have_posts()) : ?>

<section id="instagram" class="homepage-section instagram-section <?=$bg?>" data-waypoint-header="<?=get_header_color($bg)?>">
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
            
          
                <div class="faq-container" data-waypoint-animate="true">
                    <?php
                        $instagram_index = 0;
                        while ($instagram->have_posts()) :
                            $instagram->the_post();

                            $instagram_item = $post;
                            $odpowiedz = $instagram_item->post_content;
                        ?>


                        <?= wp_kses_post($odpowiedz) ?>
                </div>
                <?php
                    $instagram_index++;
                    endwhile;
                    wp_reset_postdata();
                ?>
            
        
    </div>
</section>

<?php endif; ?>