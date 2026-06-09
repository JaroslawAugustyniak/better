

<?php 
    $mainpage_item = $args; 
    $page = get_post_by_slug_and_type('strona-glowna', 'page');

    
    // Użyj WP_Query, aby pobrać opublikowane wpisy typu 'project'
    // Użyj WP_Query, aby pobrać opublikowane wpisy typu 'project'
    $args_list = array(
        'post_type' => 'faqs',
        'post_status' => 'publish',
        'posts_per_page' => -1,
        'meta_query' => array(
            'relation' => 'OR',
            array(
                'key' => 'strona',
                'value' => $page->ID,
                'compare' => '='
            ),
            array(
                'key' => 'strona',
                'value' => '"' . $page->ID . '"',
                'compare' => 'LIKE'
            )
        )
    );

    $faq = new WP_Query($args_list);

    

    $bg = get_field('kolor_tla', $mainpage_item->ID);
    $description = get_field('opis_wysiwyg', $mainpage_item->ID);



?>
<?php if ($faq->have_posts()) : ?>

<section class="homepage-section faq-section <?=$bg?>" data-waypoint-header="<?=get_header_color($bg)?>">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="section-header" data-waypoint-animate="true">
                    <h2 class="section-title"><?= $mainpage_item->post_title ?></h2>
                    <div class="section-description"><?= $description ?></div>
                </div>
            </div>
            <div class="col-lg-6">
          
                <div class="faq-container" data-waypoint-animate="true">
                    <?php
                        $faq_index = 0;
                        while ($faq->have_posts()) :
                            $faq->the_post();

                            $faq_item = $post;
                            $odpowiedz = $faq_item->post_content;
                            
                    ?>


                        <?= wp_kses_post($odpowiedz) ?>

                    
                <?php
                    $faq_index++;
                    endwhile;
                    wp_reset_postdata();
                ?>
                    <div class="section-footer" data-waypoint-animate="true">
                        <div class="d-block d-md-none"><?= $description ?></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<?php endif; ?>