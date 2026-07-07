<?php 
    $mainpage_item = $args;  
    // Użyj WP_Query, aby pobrać opublikowane wpisy typu 'project'
    $page_id = get_queried_object_id();

    if(is_front_page()){
        $args_list = array(
            'post_type'      => 'metamorphoses',   // typ wpisu
            'post_status'    => 'publish',   // tylko opublikowane
            'posts_per_page' => -1,          // wszystkie    
        );
    }else{
        $args_list = array(
            'post_type'      => 'metamorphoses',   // typ wpisu
            'post_status'    => 'publish',   // tylko opublikowane
            'posts_per_page' => -1,          // wszystkie    
            'meta_query'     => array(
                        array(
                            'key'     => 'dotyczy_uslugi',
                            'value'   => '"' . $page_id . '"',  // szukaj ID w cudzysłowie
                            'compare' => 'LIKE',
                        )
                )
        );
    }

    // pr($args_list); die;

    $metas = new WP_Query($args_list);

    $page = get_post_by_slug_and_type('metamorfozy', 'page');

    $bg = get_field('kolor_tla', $mainpage_item->ID);
    $description = get_field('opis', $mainpage_item->ID);

?>
<?php if ($metas->have_posts()) : ?>
<section class="homepage-section services section <?=$bg?>" data-waypoint-header="<?=get_header_color($bg)?>">
    <div class="container">
        <div class="homepage-section__top">
            <div class="row">
                <div class="col-lg-4 col-12">
                    <div data-waypoint-animate="true">
                        <h2 class="homepage-section__header">
                            <a href="<?=get_permalink($page->ID)?>"><?=$mainpage_item->post_title?></a>
                        </h2>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="homepage-section__description" data-waypoint-animate="true"><?=$description?></div>
                </div>
            </div>
        </div>

        <div id="metamorfoses"  data-waypoint-animate="true" class="slickSlider display_dots slick_nav nav_inside" slick_per_page="3_3_3_1" slick_show_dots="0" slick_hide_arrows="0" fade="0">   
                

                     <?php $index = 0; while ($metas->have_posts()) : 
                        $metas->the_post(); 
                        $meta = $post; 
                        $service_content = get_field('doctor');
                        $services = get_field('dotyczy_uslugi');
                        $services_list = '';
                        foreach($services as $service){
                            $services_list .= (strlen($services_list)>0?', ':'').$service->post_title;
                        }
                    ?>

                            
                            <div class="slide">
                                <div class="meta-item">
                                    <figure class="fill-box">
                                        <a href="<?=get_permalink($meta->ID)?>">
                                        <?php
                                            displayImage($meta->ID);
                                        ?>
                                        </a>
                                    </figure>

                                    <div>
                                        
                                    <h3 class="head-class">
                                        <a href="<?=get_permalink($meta->ID)?>"><?=$services_list?></a>
                                    </h3>
                                        
                                    </div>
                                    <div class="homepage-section__dsc"><?=($service_content?$service_content->post_title:'')?></div>
                                    <!-- <div class="homepage-section__buttons">
                                        <a href="<?=get_permalink($meta->ID)?>" class="link"><?=__('Dowiedz sie więcej', 'better')?></a>
                                    </div> -->
                            
                                    

                                
                                

                                </div>
                            </div>

                            <?php
                            $index++; 
                        endwhile; 
                    wp_reset_postdata();

                ?>

            </div>
            <div class="homepage-sercions__bottom" data-waypoint-animate="true">
                <a href="<?=get_permalink($page->ID)?>" class="button"><?=__('Zobacz więcej', 'better')?></a>
            </div>
        
    </div>
</section>
<?php endif; ?>