<?php 
    // Użyj WP_Query, aby pobrać opublikowane wpisy typu 'project'
    $args_list = array(
        'post_type' => 'team',  // Typ wpisu 'project'
        'post_status' => 'publish', // Tylko opublikowane wpisy
        'posts_per_page' => -1      // Pobierz wszystkie wpisy
    );

    $team = new WP_Query($args_list);

    $mainpage_item = $args; 


    $bg = get_field('kolor_tla', $mainpage_item->ID);
    $description = get_field('opis', $mainpage_item->ID);
?>

<section id="our_team" class="team_section section <?=$bg?>" data-waypoint-header="<?=get_header_color($bg)?>">
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

        <div id="team_slider"  data-waypoint-animate="true" class="slickSlider display_dots slick_nav nav_inside" slick_per_page="3_3_2_1" slick_show_dots="0" slick_hide_arrows="0" fade="0">   
                

                     <?php $index = 0; while ($team->have_posts()) : 
                        $team->the_post(); 
                        $teamitem = $post; 

                        $specjalisation = get_field('specjalizacja', $teamitem->ID);
                        $url = get_field('znany_lekarz_url', $teamitem->ID);
                    ?>

                            
                            <div class="slide">
                                <div class="team-item">
                                    <figure class="fill-box">
                                        
                                        <?php
                                            displayImage($teamitem->ID);
                                        ?>
                                        
                                    </figure>

                                    
                                        
                                    <h3 class="head-class">
                                        <?=$teamitem->post_title?>
                                    </h3>
                                        
                                    <div class="homepage-section__dsc"><?=$specjalisation?></div>
                                    <div class="homepage-section__buttons">
                                        <a href="<?=$url?>" class="button"><?=__('Umów konsultację', 'better')?></a>
                                    </div>
                            
                                    

                                
                                

                                </div>
                            </div>

                            <?php
                            $index++;
                        endwhile;
                        wp_reset_postdata();


                ?>

        </div>

    </div>
</section>