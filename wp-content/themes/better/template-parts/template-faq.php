<?php
    $bg = 'colorset--color-1';

    // Pobierz ID usługi z query var (przekazane z content-service.php)
    $service_id = get_query_var( 'service_id' );

    $mainpage_item = get_post_by_slug_and_type('pytania-i-odpowiedzi', 'static');
    $opis = get_field('tresc', $mainpage_item->ID);

    // Fallback na globalny $post jeśli query_var nie jest ustawiony
    if ( ! $service_id ) {
        global $post;
        $service_id = $post->ID;
    }

    // Query dla FAQ przypisanych do tej usługi
    $faq_args_list = array(
        'post_type'      => 'faq',
        'post_status'    => 'publish',
        'posts_per_page' => -1,
        'meta_query'     => array(
            array(
                'key'     => 'usluga',
                'value'   => '"' . $service_id . '"',
                'compare' => 'LIKE',
            ),
        ),
    );

    $faq = new WP_Query( $faq_args_list );

?>
<?php if ($faq->have_posts()) : ?>

<section class="homepage-section faq-section <?=$bg?>" data-waypoint-header="<?=get_header_color($bg)?>">
    <div class="container">
            <div class="section-header text-center" data-waypoint-animate="true">
                <h2 class="section-title"><?= $mainpage_item->post_title ?></h2>
                <p class="section-subtitle"><?= $opis ?></p>
            </div>
          
        <div class="faq-container" data-waypoint-animate="true">
            <div class="accordion accordion-faq" id="faqAccordion">
                <?php
                    $faq_index = 0;
                    while ($faq->have_posts()) :
                        $faq->the_post();
                        $faq_item = $post;
                        $pytanie = $faq_item->post_title;
                        $odpowiedz = $faq_item->post_content;
                        $faq_id = 'faqItem' . $faq_item->ID;
                ?>
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#<?=$faq_id?>" aria-expanded="false" aria-controls="<?=$faq_id?>">
                                <?= esc_html($pytanie) ?>
                            </button>
                        </h2>
                        <div id="<?=$faq_id?>" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                <?= wp_kses_post($odpowiedz) ?>
                            </div>
                        </div>
                    </div>
                <?php
                    $faq_index++;
                    endwhile;
                ?>
            </div>
        </div>
    </div>
</section>

<?php endif; ?>