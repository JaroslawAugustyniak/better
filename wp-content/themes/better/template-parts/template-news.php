<?php 
    // Użyj WP_Query, aby pobrać opublikowane wpisy typu 'project'
    $args_list = array(
        'post_type' => 'news',  // Typ wpisu 'project'
        'post_status' => 'publish', // Tylko opublikowane wpisy
        'posts_per_page' => -1      // Pobierz wszystkie wpisy
    );

    $news = new WP_Query($args_list);

    
    $page = get_post_by_slug_and_type('klinika-stomatologiczna-warszawa', 'page');
    $mainpage_item = $args; 
?>

 <?php if ($news->have_posts()) : ?>
<section class="homepage-section section colorset--color-1" data-waypoint-header="page-header--color-1">
    <div class="container">
        <div class="homepage-section__top">
            <div class="row">
                <div class="col-lg-3 col-12">
                    <div data-waypoint-animate="true">
                        <h1 class="homepage-section__header">
                            <a href="<?=get_permalink($page->ID)?>"><?=$mainpage_item->post_title?></a>
                        </h1>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="homepage-section__baners-arrows" data-waypoint-animate="true"></div>
                </div>
            </div>
        </div>

        <div class="homepage-section__baners">

            

            <?php $index = 0; while ($news->have_posts()) : 
                $news->the_post(); 
                $new = $post; 
                $button = get_field('button');
            ?>


                    <div>
                        <div class="row flex-lg-row-reverse align-items-lg-end justify-content-lg-between">
                            <div class="col-lg-7 col-12">
                                <div class="homepage-section__baners-item" data-waypoint-animate="true">
                                    <figure class="fit-box">
                                    
                                        <?php
                                            displayImage($new->ID);
                                        ?>
                                    
                                    </figure>
                                    
                                </div>
                            </div>
                            <div class="col-lg-4 col-lg-5 col-md-9 col-12">
                                <div class="homepage-section__title" data-waypoint-animate="true">
                                    <h3 class="head-class">
                                        <?=$new->post_title?>
                                    </h3>
                                </div>
                                <div class="homepage-section__dsc" data-waypoint-animate="true">
                                    <?=$new->post_content?>
                                </div>
                                <div class="homepage-section__buttons" data-waypoint-animate="true">
                                    <?php if ($button): ?>
                                                    <a class="button" 
                                                    href="<?=$button['url']?>" 
                                                    target="<?=$button['target']?>" data-no-scroll="1">
                                                        <?=$button['title']?>
                                                    </a>
                                    <?php endif; ?>
                                </div>
                            </div>
                        </div>
                    </div>
            <?php $index++; endwhile; ?>
        </div>
    </div>
</section>
<?php endif; ?>