

<?php 
    $post_id = get_the_ID(); 
    $mainpage_item = $args; 

    
    $args_list = array(
        'post_type' => 'faqs',
        'post_status' => 'publish',
        'posts_per_page' => -1,
        'meta_query' => array(
            'relation' => 'OR',
            array(
                'key' => 'strona',
                'value' => $post_id,
                'compare' => '='
            ),
            array(
                'key' => 'strona',
                'value' => '"' . $post_id . '"',
                'compare' => 'LIKE'
            )
        )
    );

    $faq = new WP_Query($args_list);

    

    $bg = get_field('kolor_tla', $mainpage_item->ID);
    $description = get_field('opis_wysiwyg', $mainpage_item->ID);



?>

<?php if ($faq->have_posts()) : ?>
<section class="homepage-section faq-section faq_page <?=$bg?>" data-waypoint-header="<?=get_header_color($bg)?>">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3">
                <div class="section-header" data-waypoint-animate="true">
                    <h2 class="section-title"><?= $mainpage_item->post_title ?></h2>
                </div>
            </div>
            <div class="col-lg-6 offset-lg-3">
          
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
        </div>
    </div>
</section>
<?php endif; ?>
