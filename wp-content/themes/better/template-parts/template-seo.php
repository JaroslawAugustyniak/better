

<?php 
    $mainpage_item = $args; 
    $page = get_post_by_slug_and_type('strona-glowna', 'page');

    
    // Użyj WP_Query, aby pobrać opublikowane wpisy typu 'project'
    // Użyj WP_Query, aby pobrać opublikowane wpisy typu 'project'
    $args_list = array(
        'post_type' => 'seo',
        'post_status' => 'publish',
        'posts_per_page' => -1,
        'meta_query' => array(
            array(
                'key' => 'strona',
                'value' => $page->ID,
                'compare' => '='
            )
        )
    );

    $faq = new WP_Query($args_list);

    

    $bg = get_field('kolor_tla', $mainpage_item->ID);
    $description = get_field('opis_wysiwyg', $mainpage_item->ID);



?>
<?php if ($faq->have_posts()) : ?>

<section class="homepage-section seo-section <?=$bg?>" data-waypoint-header="<?=get_header_color($bg)?>">
    <div class="container">
        
                <div class="section-header" data-waypoint-animate="true">
                    <span class="section-title"><?= $mainpage_item->post_title ?></span>
                </div>
            
          
                <div class="seo-container" data-waypoint-animate="true">
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
                ?>
                </div>
                <div class="text-center" data-waypoint-animate="true">
                    <a href="javascript:void(0)" class="link toggle_button" >
                        <span class="closed"><?php esc_html_e( 'Czytaj więcej', 'better' ); ?></span>
                        <span class="opened"><?php esc_html_e( 'Zamknij', 'better' ); ?></span>
                        
                    </a>
                </div>
    </div>
</section>

<?php endif; ?>