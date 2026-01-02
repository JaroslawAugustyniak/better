<?php 
    // Użyj WP_Query, aby pobrać opublikowane wpisy typu 'project'
    $args_list = array(
        'post_type' => 'video',  // Typ wpisu 'project'
        'post_status' => 'publish', // Tylko opublikowane wpisy
        'posts_per_page' => -1      // Pobierz wszystkie wpisy
    );

    $videos = new WP_Query($args_list);

    $mainpage_item = $args; 
    $opis = get_field('opis', $mainpage_item->ID);
?>
<?php if ($videos->have_posts()) : ?>
<section class="homepage-section youtube-section colorset--color-2" data-waypoint-header="page-header--color-2">
        <div class="container">
            <div class="section-header text-center" data-waypoint-animate="true">
                <h2 class="section-title"><?= $mainpage_item->post_title ?></h2>
                <p class="section-subtitle"><?= $opis ?></p>
            </div>
            
            <div class="youtube-carousel-container" data-waypoint-animate="true">
                <div class="youtube-carousel" id="youtubeCarousel">
                    <?php $index = 0; while ($videos->have_posts()) : 
                            $videos->the_post(); 
                            $video = $post; 

                            $zdjecie = get_field('obrazek_filmu', $video->ID);
                            $opinia = get_field('opinia', $video->ID);
                            $video_id = get_field('identyfikator_filmy_z_youtube', $video->ID);
                            ?>
                        <div class="youtube-slide" data-index="<?=$index?>" data-video-id="<?=$video_id?>" data-title="<?= $video->post_title ?>">
                            <div class="slide-image-container">
                                <img src="<?=$zdjecie?$zdjecie['url']:''?>" 
                                     alt="<?= $video->post_title ?>" 
                                     loading="lazy"
                                     onerror="this.src='https://img.youtube.com/vi/<?=$video_id?>/hqdefault.jpg'; this.onerror=null;">
                                    <div class="slide-overlay">
                                        <div class="play-button">
                                            <i class="fas fa-play"></i>
                                        </div>
                                    </div>
                            </div>
                            <div class="slide-content">
                                <h3 class="slide-title"><?= $video->post_title ?></h3>
                            </div>
                        </div>
                    <?php $index++; endwhile; ?>
                </div>
            </div>
        </div>
    </section>


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
                            $opinia = get_field('opinia', $video->ID);
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
<?php endif; ?>