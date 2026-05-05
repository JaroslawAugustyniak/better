<?php

/**
 * Template Name: Magazyn
 * 
 * 
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package K5
 */

get_header(); 

    $args_list = array(
        'post_type' => 'magazyn',  // Typ wpisu 'project'
        'post_status' => 'publish', // Tylko opublikowane wpisy
        'posts_per_page' => -1      // Pobierz wszystkie wpisy
    );

    $magazynY = new WP_Query($args_list);

    global $post; 


    $current_page = $post;

?>
<section class="" data-waypoint-header="page-header--color-6">
    <div class="content-header colorset--color-7">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6 col-lg-8 col-md-9 col-sm-10 col-xs-11 col-12">
                    <div class="content-header__title" data-waypoint-animate="true">
                        <h1 class="head-class"><?=$current_page->post_title?></h1>
                    </div>
                    <div class="content-header__dsc" data-waypoint-animate="true">
                     <?php 
                            $content = $current_page->post_content;
                            $content = apply_filters( 'the_content', $content );
                            $content = str_replace( ']]>', ']]&gt;', $content );
                            echo $content;
                            ?>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>

<?php if ($magazynY->have_posts()) : ?>
    <div class="content-news-list colorset--color-4">
        <div class="container">

            <div class="grid row">

                            
                <?php $index = 0; while ($magazynY->have_posts()) : 
                    $magazynY->the_post(); 
                    $magazyn = $post; 
                    $magazyn_title = get_field('naglowek');
                    if(!$magazyn_title) $magazyn_title = $magazyn->post_title;
                    $magazyn_content = get_field('krotki_opis');
                ?>
                
                        <div class="col-lg-4 col-12 grid-item">
                            <div class="news-element" 
                             data-index="<?= $index ?>" 
                             data-news-id="<?=$magazyn->ID?>" 
                             data-title="<?=$magazyn->post_title?>"
                             data-url="<?=get_permalink($magazyn->ID)?>"  data-waypoint-animate="true">
                            
                            <a href="<?=get_permalink($magazyn->ID)?>" class="news-card">
                                <div class="news-image-container">
                                    <?php displayImage($magazyn->ID); ?>
                                    

                                    <div class="news-date-badge">
                                        <span class="date-day"><?= get_the_date('d') ?> </span>
                                        <span class="date-month"><?= get_the_date('m') ?></span>
                                    </div>
                                    
                                </div>
                                
                                <div class="news-content">
                                    <h3 class="news-title"><?=$magazyn_title?></h3>
                                    <p class="news-excerpt"><?=$magazyn_content?></p>
                                    
                                </div>
                            </a>
                        </div>
                        </div>
                    
                <?php $index++; endwhile; ?>

            </div>
        </div>
    </div>

    <?php endif; ?>

</section>


<?php
get_footer();
