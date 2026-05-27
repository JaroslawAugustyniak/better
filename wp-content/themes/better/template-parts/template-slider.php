<?php 
    // Użyj WP_Query, aby pobrać opublikowane wpisy typu 'project'
    $args_list = array(
        'post_type' => 'slider',  // Typ wpisu 'project'
        'post_status' => 'publish', // Tylko opublikowane wpisy
        'posts_per_page' => -1      // Pobierz wszystkie wpisy
    );

    $slider = new WP_Query($args_list);
?>
<section class="slider-section position-relative" data-waypoint-header="page-header--color-9">
    <div id="parallax">
    <div id="parallax-inner">
    <div class="slider-container">
        <?php if ($slider->have_posts()) : ?>
        
            <div id="mainSlider" auto_play="1" class="main-slider slickSlider display_dots slick_nav nav_inside" slick_per_page="1_1_1_1" slick_show_dots="0" slick_hide_arrows="0" fade="1">   
            <?php $index = 0; while ($slider->have_posts()) : $slider->the_post(); $slide = $post;
            $button = get_field('button');
            
            ?>
                <div class="slider-slide" data-index="<?=$index?>">
                    <div class="slide-background">
                            <?php
                                displayImage($slide->ID);
                            ?>
                        
                        <div class="slide-overlay"></div>
                    </div>
                    
                    <div class="slide-content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-8 offset-lg-2">
                                    <div class="slide-text-content text-center">
                                        
                                            <h1 class="slide-title"><?=$slide->post_title?></h1>
                                        
                                        
                                        
                                            <div class="slide-description">
                                                <?=$slide->post_content?>
                                            </div>
                                        
                                            <?php if ($button): ?>
                                            <div class="slide-button-container">
                                                <a class="button slide-button" 
                                                   href="<?=$button['url']?>" 
                                                   target="<?=$button['target']?>">
                                                    <?=$button['title']?>
                                                </a>
                                            </div>
                                            <?php endif; ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <?php $index++; endwhile; ?>
            <?php endif; ?>
        </div>
        
       
        
    </div>
    </div>
    </div>
</section>