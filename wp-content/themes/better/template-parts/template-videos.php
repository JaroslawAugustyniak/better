
<?php 
    $mainpage_item = $args; 
    // Użyj WP_Query, aby pobrać opublikowane wpisy typu 'project'
    // Użyj WP_Query, aby pobrać opublikowane wpisy typu 'project'
    $args_list = array(
        'post_type' => 'video',  // Typ wpisu 'project'
        'post_status' => 'publish', // Tylko opublikowane wpisy
        'posts_per_page' => -1      // Pobierz wszystkie wpisy
    );

    $videos = new WP_Query($args_list);

    $bg = get_field('kolor_tla', $mainpage_item->ID);
    $description = get_field('opis', $mainpage_item->ID);

?>
<?php if ($videos->have_posts()) : ?>
<section class="homepage-section videos section <?=$bg?>" data-waypoint-header="<?=get_header_color($bg)?>">
    <div class="container-full">
        

        <div id="videos" class="slickSlider display_dots slick_nav nav_inside" auto_play="1" speed="15000"  slick_per_page="1_1_1_1" slick_show_dots="1" slick_hide_arrows="0" fade="0">   
                
                    <?php $index = 0; while ($videos->have_posts()) :
                            $videos->the_post();
                            $video = $post;

                            $zdjecie = get_field('obrazek_filmu', $video->ID);
                            $opinia = get_field('opis_filmu', $video->ID);
                            $video_id = get_field('identyfikator_filmy_z_youtube', $video->ID);
                            $short_video = get_field('short_video', $video->ID);
                            ?>
                        <div class="youtube-slide" data-index="<?=$index?>" data-video-id="<?=$video_id?>" data-title="<?= $video->post_title ?>" <?php if ($short_video) : ?>data-short-video="<?= esc_attr($short_video) ?>"<?php endif; ?>>
                            <?php $transcrypt = get_field('transcrypt', $video->ID); if ($transcrypt) : ?>
                            <script type="application/ld+json">
                            {
                                "@context": "https://schema.org",
                                "@type": "VideoObject",
                                "name": <?= json_encode($video->post_title) ?>,
                                "thumbnailUrl": "<?= $zdjecie ? esc_url($zdjecie['url']) : 'https://img.youtube.com/vi/'.$video_id.'/hqdefault.jpg' ?>",
                                "embedUrl": "https://www.youtube.com/embed/<?= esc_attr($video_id) ?>",
                                "transcript": <?= json_encode($transcrypt) ?>
                            }
                            </script>
                            <?php else: ?><div class="no-transcript"></div><?php endif; ?>
                            <div class="slide-image-container">
                                <?php if ($short_video) : ?>
                                    <video class="slide-video"
                                           playsinline
                                           autoplay
                                           muted
                                           loop
                                           loading="lazy"
                                           poster="<?=$zdjecie?$zdjecie['url']:'https://img.youtube.com/vi/'.$video_id.'/hqdefault.jpg'?>">
                                        <source src="<?= esc_attr($short_video) ?>" type="video/mp4">
                                    </video>
                                <?php endif; ?>
                                <img src="<?=$zdjecie?$zdjecie['url']:''?>"
                                     alt="<?= $video->post_title ?>"
                                     loading="lazy"
                                     <?php if ($short_video) : ?>style="display:none;"<?php endif; ?>
                                     onerror="this.src='https://img.youtube.com/vi/<?=$video_id?>/hqdefault.jpg'; this.onerror=null;">

                            </div>
                            <div class="slide-content">
                                <h3 class="slide-title"><?= $video->post_title ?></h3>
                                <p><?=$opinia?></p>
                                <a class="button play-button">
                                    Obejrzyj film
                                </a>
                            </div>
                        </div>
                    <?php $index++; endwhile; ?>
                
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
<?php endif; ?> 