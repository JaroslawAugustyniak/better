<?php 
    // Użyj WP_Query, aby pobrać opublikowane wpisy typu 'project'
    global $post;

    if($args):

        $bg = 'colorset--color-1';

        $mainpage_item = $args; 
        $opis = get_field('opis', $mainpage_item->ID);

        $args_list = array(
            'post_type' => 'comment',  // Typ wpisu 'project'
            'post_status' => 'publish', // Tylko opublikowane wpisy
            'posts_per_page' => -1      // Pobierz wszystkie wpisy
        );

        $comments = new WP_Query($args_list);
    else:

        $bg = 'colorset--color-8';

        global $post;

        $mainpage_item = get_post_by_slug_and_type('opinie-naszych-pacjentow', 'mainpage');
        $opis = get_field('opis', $mainpage_item->ID);

                $args_list = array(
                    'post_type'      => 'comment',
                    'post_status'    => 'publish',
                    'posts_per_page' => -1,
                    'meta_query'     => array(
                        array(
                            'key'     => 'dotyczy_uslugi',
                            'value'   => '"' . $post->ID . '"',  // szukaj ID w cudzysłowie
                            'compare' => 'LIKE',
                        ),
                    ),
                );

        $comments = new WP_Query( $args_list );        
 
    endif;
?>
<?php if ($comments->have_posts()) : ?>

<section class="homepage-section comments-section <?=$bg?>" data-waypoint-header="<?=get_header_color($bg)?>">
        <div class="container">
            <div class="section-header text-center" data-waypoint-animate="true">
                <h2 class="section-title"><?= $mainpage_item->post_title ?></h2>
                <p class="section-subtitle"><?= $opis ?></p>
            </div>
            
            <div class="comments-carousel-container" data-waypoint-animate="true">
                <div class="comments-carousel" id="commentsCarousel">
                    <?php $index = 0; while ($comments->have_posts()) : 
                            $comments->the_post(); 
                            $comment = $post; 

                            $zdjecie = get_field('zdjecie', $comment->ID);
                            $opinia = get_field('opinia', $comment->ID);



                            // Przygotuj podgląd treści (pierwsze 200 znaków)
                            $content_preview = strip_tags($opinia);
                            if (strlen($content_preview) > 200) {
                                $content_preview = substr($content_preview, 0, 200) . '...';
                            }
                            
                            // Sprawdź czy komentarz wymaga rozwinięcia
                            $needs_expansion = (strlen(strip_tags($opinia)) > 200);
                            
                            // Oczyść HTML w treści dla bezpieczeństwa (opcjonalnie)
                            $content_safe = htmlspecialchars_decode($opinia);
                        ?>
                        <div class="comment-slide" data-index="<?=$index?>" data-comment-id="<?=$comment->ID?>" data-author="<?= $comment->post_title ?>">
                            <div class="comment-card">
                                <div class="comment-header">
                                    <div class="comment-avatar">
                                        <?php
                                            displayImageACF($zdjecie, $comment->post_title);
                                        ?>
                                    </div>
                                    
                                </div>
                                
                                <div class="comment-content">
                                    <div class="comment-text">
                                        <?php if ($needs_expansion): ?>
                                            <div class="comment-preview"><?=$content_preview?></div>
                                            <div class="comment-full" style="display: none;"><?=$content_safe?></div>
                                            <button class="comment-toggle" data-action="expand">
                                                <span class="expand-text"><?=__('czytaj więcej', 'better') ?></span>
                                                <span class="collapse-text" style="display: none;"><?=__('zwiń', 'better') ?></span>
                                            </button>
                                        <?php else: ?>
                                            <?=$content_safe?>
                                        <?php endif; ?>
                                    </div>
                                </div>
                                <div class="comment-meta">
                                        <h3 class="comment-author"><?= $comment->post_title ?></h3>
                                        
                                    </div>
                                
                            </div>
                        </div>
                    <?php $index++; endwhile; ?>
                </div>
                
               
                
                <!-- Counter Display -->
                <div class="carousel-counter">
                    <span class="current-slide">1</span>
                    <span class="separator">/</span>
                    <span class="total-slides">{{ komentarze_home|length }}</span>
                </div>
            </div>
        </div>
    </section>

<?php endif; ?>