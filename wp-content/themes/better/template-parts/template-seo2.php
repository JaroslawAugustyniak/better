

<?php
    // Pobierz ID strony na podstawie bieżącego URL
    $current_page = get_queried_object_id();

    // Użyj WP_Query, aby pobrać opublikowane wpisy typu 'seo'
    $args_list = array(
        'post_type' => 'seo',
        'post_status' => 'publish',
        'posts_per_page' => -1,
        'meta_query' => array(
            array(
                'key' => 'strona',
                'value' => $current_page,
                'compare' => '='
            )
        )
    );

    $faq = new WP_Query($args_list);



    $bg = 'colorset--color-5';
    



?>
<?php if ($faq->have_posts()) : ?>

<section class="seo-section seo-section-page <?=$bg?>" data-waypoint-header="<?=get_header_color($bg)?>">
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
            
          
                <div class="seo-container seo-page" data-waypoint-animate="true">
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
                        <span class="closed"><?php esc_html_e( 'Rozwiń', 'better' ); ?></span>
                        <span class="opened"><?php esc_html_e( 'Zwiń', 'better' ); ?></span>                        
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<?php endif; ?>