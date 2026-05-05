<?php 
    // Użyj WP_Query, aby pobrać opublikowane wpisy typu 'project'
    $args_list = array(
        'post_type'      => 'service',   // typ wpisu
        'post_status'    => 'publish',   // tylko opublikowane
        'posts_per_page' => -1,          // wszystkie
        'post_parent'    => 0            // tylko wpisy bez parenta
    );

    $services = new WP_Query($args_list);

    

    $page = get_post_by_slug_and_type('uslugi', 'page');
    $mainpage_item = $args; 
?>
<?php if ($services->have_posts()) : ?>
<section class="homepage-section section colorset--color-2" data-waypoint-header="page-header--color-2">
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
             <?php $index = 0; while ($services->have_posts()) : 
                $services->the_post(); 
                $service = $post; 
                $service_title = get_field('service_title');
                $service_content = get_field('opis_uslugi_w_listach');
            ?>
                <div>
                    <div class="row flex-lg-row-reverse align-items-lg-end justify-content-lg-between">
                        <div class="col-lg-7 col-12">
                            <div class="homepage-section__baners-item" data-waypoint-animate="true">
                                <figure class="fill-box">
                                     <?php
                                            displayImage($service->ID);
                                        ?>
                                </figure>
                            </div>
                        </div>
                        <div class="col-lg-4 col-lg-5 col-md-9 col-12">
                            <div class="homepage-section__title" data-waypoint-animate="true">
                                <h2 class="head-class"><?=$service_title?></h2>
                            </div>
                            <div class="homepage-section__dsc" data-waypoint-animate="true"><?=$service_content?></div>
                            <div class="homepage-section__buttons   " data-waypoint-animate="true">
                                    <a href="<?=get_permalink($service->ID)?>" class="button"><?=__('Dowiedz sie więcej', 'better')?></a>
                            </div>
                            
                        </div>
                    </div>
                </div>
            <?php $index++; endwhile; ?>
        </div>
    </div>
</section>
<?php endif; ?>