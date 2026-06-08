

<?php 
    $mainpage_item = $args; 
    $current_page = isset($args->current_page) ? $args->current_page : get_queried_object_id();

    
    $args_list = array(
        'post_type' => 'faqs',
        'post_status' => 'publish',
        'posts_per_page' => -1,
        'meta_query' => array(
            'relation' => 'OR',
            array(
                'key' => 'strona',
                'value' => $current_page,
                'compare' => '='
            ),
            array(
                'key' => 'strona',
                'value' => '"' . $current_page . '"',
                'compare' => 'LIKE'
            )
        )
    );

    $faq = new WP_Query($args_list);

    

    $bg = get_field('kolor_tla', $mainpage_item->ID);
    $description = get_field('opis_wysiwyg', $mainpage_item->ID);



?>

<section class="homepage-section faq-section faq_page <?=$bg?>" data-waypoint-header="<?=get_header_color($bg)?>">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3">
                <div class="section-header" data-waypoint-animate="true">
                    <h2 class="section-title"><?= $mainpage_item->post_title ?></h2>
                </div>
            </div>
            <div class="col-lg-6 offset-lg-3">
                <?php if ($faq->have_posts()) : ?>
          
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
            </div>
            <?php endif; ?>
        </div>
    </div>
</section>
