<?php 
    // Użyj WP_Query, aby pobrać opublikowane wpisy typu 'project'
    global $post;

    if($args):

        $mainpage_item = $args; 

       

        $bg = get_field('kolor_tla', $mainpage_item->ID);
        $description = get_field('opis', $mainpage_item->ID);

        $opis = get_field('opis', $mainpage_item->ID);

        $args_list = array(
            'post_type' => 'comment',  // Typ wpisu 'project'
            'post_status' => 'publish', // Tylko opublikowane wpisy
            'posts_per_page' => -1,      // Pobierz wszystkie wpisy
        );

        $comments = new WP_Query($args_list);

        $args_list = array(
            'post_type' => 'video',  // Typ wpisu 'project'
            'post_status' => 'publish', // Tylko opublikowane wpisy
            'posts_per_page' => -1      // Pobierz wszystkie wpisy
        );

        $videos = new WP_Query($args_list);

        // Scalenie wyników z obu zapytań
        $comments_posts = $comments->get_posts();
        $videos_posts = $videos->get_posts();

        $mixed_posts = array();
        $max_count = max(count($comments_posts), count($videos_posts));

        // Naprzemiennie dodawaj wpisy z obu typów
        for ($i = 0; $i < $max_count; $i++) {
            if ($i < count($comments_posts)) {
                $item = $comments_posts[$i];
                $item->item_type = 'comment';
                $mixed_posts[] = $item;
            }
            if ($i < count($videos_posts)) {
                $item = $videos_posts[$i];
                $item->item_type = 'video';
                $mixed_posts[] = $item;
            }
        }


    else:

        $bg = 'colorset--color-6';

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
        
        $args_list = array(
            'post_type' => 'video',  // Typ wpisu 'project'
            'post_status' => 'publish', // Tylko opublikowane wpisy
            'posts_per_page' => -1,      // Pobierz wszystkie wpisy
            'meta_query'     => array(
                        array(
                            'key'     => 'dotyczy_uslugi',
                            'value'   => '"' . $post->ID . '"',  // szukaj ID w cudzysłowie
                            'compare' => 'LIKE',
                        ),
                    ),
        );

        $videos = new WP_Query($args_list);

        // Scalenie wyników z obu zapytań
        $comments_posts = $comments->get_posts();
        $videos_posts = $videos->get_posts();

        $mixed_posts = array();
        $max_count = max(count($comments_posts), count($videos_posts));

        // Naprzemiennie dodawaj wpisy z obu typów
        for ($i = 0; $i < $max_count; $i++) {
            if ($i < count($comments_posts)) {
                $item = $comments_posts[$i];
                $item->item_type = 'comment';
                $mixed_posts[] = $item;
            }
            if ($i < count($videos_posts)) {
                $item = $videos_posts[$i];
                $item->item_type = 'video';
                $mixed_posts[] = $item;
            }
        }
 
    endif;
?>
<?php if (!empty($mixed_posts)) : ?>

<section class="homepage-section opinions opinionsmix section <?=$bg?>" data-waypoint-header="<?=get_header_color($bg)?>">
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

            <div class="opinions-carousel-container" data-waypoint-animate="true">

                    <div id="opinionsmixCarousel"  data-waypoint-animate="true" auto_play="1"  variable_width="1" class="comments-carousel slickSlider display_dots slick_nav nav_inside" slick_per_page="3_3_2_1" slick_show_dots="0" slick_hide_arrows="0" fade="0">
                    <?php $index = 0; foreach ($mixed_posts as $post_item) :
                            setup_postdata($post_item);
                            $item_type = $post_item->item_type;

                            if ($item_type === 'comment') {
                                $zdjecie = get_field('zdjecie', $post_item->ID);
                                $opinia = get_field('opinia', $post_item->ID);

                                // Przygotuj podgląd treści (pierwsze 200 znaków)
                                $content_preview = strip_tags($opinia);
                                if (strlen($content_preview) > 200) {
                                    $content_preview = substr($content_preview, 0, 200) . '...';
                                }

                                // Sprawdź czy komentarz wymaga rozwinięcia
                                $needs_expansion = (strlen(strip_tags($opinia)) > 200);

                                // Oczyść HTML w treści dla bezpieczeństwa
                                $content_safe = htmlspecialchars_decode($opinia);
                            ?>
                        <div class="comment-slide" data-index="<?=$index?>" data-comment-id="<?=$post_item->ID?>" data-author="<?= $post_item->post_title ?>" data-type="comment">
                            <div class="comment-card">

                                <div class="comment-avatar">
                                    <?php
                                        displayImageACF($zdjecie, $post_item->post_title);
                                    ?>
                                </div>

                                <div class="rateholder">
                                    <div class="stars" data-rate="4">

                                    </div>
                                    <div class="rate">5/5 Google</div>
                                </div>

                                <div class="comment-content">
                                    <div class="comment-text">
                                        <?php if ($needs_expansion): ?>
                                            <div class="comment-preview"><?=$content_preview?></div>
                                            <div class="comment-full" style="display: none;"><?=$content_safe?></div>
                                            <a class="comment-toggle link" data-comment-id="<?=$post_item->ID?>" href="javascript:void(0);"><?=__('czytaj więcej', 'better') ?></a>
                                        <?php else: ?>
                                            <?=$content_safe?>
                                        <?php endif; ?>
                                    </div>
                                    <div class="comment-meta">
                                        <h3 class="comment-author"><?= $post_item->post_title ?></h3>
                                    </div>
                                </div>

                            </div>
                        </div>
                            <?php } elseif ($item_type === 'video') {
                                $zdjecie = get_field('obrazek_filmu', $post_item->ID);
                                $opinia = get_field('opis_filmu', $post_item->ID);
                                $video_id = get_field('identyfikator_filmy_z_youtube', $post_item->ID);
                            ?>
                        <div class="youtube-slide comment-slide" data-index="<?=$index?>" data-video-id="<?=$video_id?>" data-title="<?= $post_item->post_title ?>">
                            
                            <div class="slide-image-container">
                                
                                <img src="<?=$zdjecie?$zdjecie['url']:''?>"
                                     alt="<?= $post_item->post_title ?>"
                                     loading="lazy"
                                     onerror="this.src='https://img.youtube.com/vi/<?=$video_id?>/hqdefault.jpg'; this.onerror=null;">

                            </div>
                            <div class="slide-content">
                                <a class="button play-button">
                                    <i class="fa fa-play"></i>
                                </a>
                                <div class="content">
                                    <h3 class="slide-title"><?= $post_item->post_title ?></h3>
                                    <p><?=$opinia?></p>
                                </div>
                            </div>
                        </div>
                            <?php } ?>
                    <?php $index++; endforeach; wp_reset_postdata(); ?>
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

    <!-- Comment Modal -->
    <div class="comment-modal" id="commentModal">
        <div class="comment-modal-overlay"></div>
        <div class="comment-modal-content">
            <button class="comment-modal-close"></button>

            <div class="comment-modal-rates">
                <div class="comment-modal-stars"></div>
                <div class="comment-modal-rate"></div>
            </div>

            <div class="comment-modal-text"></div>

            <div class="comment-modal-author"></div>
        </div>
    </div>

<?php endif; ?>
<?php if ($videos->have_posts()) : ?>
<div class="youtube-modal" id="youtubeModal">
        <div class="modal-backdrop"></div>
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="modalTitle">Tytuł filmu</h3>
                <button class="modal-close" id="modalClose" type="button" aria-label="Zamknij">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            
            <div class="modal-video-container">
                <iframe id="modalVideo" src="" frameborder="0" allowfullscreen></iframe>
                
                <button class="modal-nav prev" id="modalPrev" type="button" aria-label="Poprzedni film">
                    <i class="fas fa-chevron-left"></i>
                </button>
                <button class="modal-nav next" id="modalNext" type="button" aria-label="Następny film">
                    <i class="fas fa-chevron-right"></i>
                </button>
            </div>
            
            <div class="modal-thumbnails">
                <h4><?= __('Wszystkie filmy', 'better')?></h4>
                <div class="thumbnails-container" id="thumbnailsContainer">
                    <?php $index = 0; while ($videos->have_posts()) : 
                            $videos->the_post(); 
                            $video = $post; 

                            $zdjecie = get_field('obrazek_filmu', $video->ID);
                            $opinia = get_field('opis_filmu', $video->ID);
                            $video_id = get_field('identyfikator_filmy_z_youtube', $video->ID);
                            ?>
                        <div class="thumbnail-item" 
                            data-index="<?=$index?>" 
                            data-video-id="<?=$video_id?>" 
                            data-title="<?=$video->post_title?>"
                            data-thumbnail-source="<?=($zdjecie ? $zdjecie['url'] : '')?>">
                            <div class="thumbnail-image-wrapper">
                                <img src="<?=($zdjecie ? $zdjecie['url'] : '')?>" 
                                    alt="<?=$video->post_title?>"
                                    loading="lazy"
                                    onerror="this.src='https://img.youtube.com/vi/<?=$video_id?>/mqdefault.jpg'; this.onerror=null; this.parentElement.classList.add('fallback-thumbnail');">
                                
                                
                            </div>
                            
                        </div>
                    <?php $index++; endwhile; ?>
                </div>
            </div>
        </div>
    </div>
<?php wp_reset_postdata(); endif; ?> 