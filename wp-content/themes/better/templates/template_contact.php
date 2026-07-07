<?php

/**
 * Template Name: Kontakt
 * 
 * 
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package K5
 */
global $page;

get_header(); 

?>


<?php

global $post; 


$current_page = $post;
$page_content = split_post_content_by_more($post);


$kolor_tla_naglowka = get_field('kolor_tla_naglowka', $current_page->ID);
$kolor_tla_ = get_field('kolor_tla_', $current_page->ID);



?>

<section class="" data-waypoint-header="<?=get_header_color($kolor_tla_naglowka)?>">
        
        <div class="content-header <?=$kolor_tla_naglowka?>">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-6 col-lg-8 col-md-9 col-sm-10 col-xs-11 col-12">
                        <?php if (function_exists("rank_math_the_breadcrumbs")) rank_math_the_breadcrumbs(); ?>

                        <div class="content-header__title" data-waypoint-animate="true">

                                <h1 class="head-class"><?= $current_page->post_title ?></h1>

                        </div>

                        <div class="content-header__dsc" data-waypoint-animate="true">
                            <?=$page_content['before']?>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        

        <article class="content-article <?=$kolor_tla_?>"  data-waypoint-header="<?=get_header_color($kolor_tla_)?>">
            <div class="container">	
                <div class="row">

                <?php 
                    $static_kontakt = get_post_by_slug_and_type('umow-wizyte', 'static');
    $static_info = get_post_by_slug_and_type('dane-adresowe-w-menu', 'static');
    $static_socials = get_post_by_slug_and_type('sociale', 'static');
    ?>

                <div class="col-xl-4 col-lg-5 col-12">
                    <div class="contact-section__header-description"><?php echo apply_filters( 'the_content', $static_kontakt->post_content ); ?></div>
                    <div class="row">
                        <div class="col-6">
                            <div class="contact-section__info">
                                <?php echo apply_filters( 'the_content', $static_info->post_content ); ?>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="contact-section__info">
                                <?php echo apply_filters( 'the_content', $static_socials->post_content ); ?>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="d-none d-md-block offset-lg-1 offset-xl-2 scol-xl-6 col-lg-6 col-12">
                    <div class="contact-section__form " id="znany_lekarz">
                            <p><?=__('Wybierz lekarza i zarezerwuj termin konsultacji przez Znany Lekarz.', 'better')?></p>                            
                            
                            <?php 
                                // Użyj WP_Query, aby pobrać opublikowane wpisy typu 'project'
                                $args_list = array(
                                    'post_type' => 'team',  // Typ wpisu 'project'
                                    'post_status' => 'publish', // Tylko opublikowane wpisy
                                    'posts_per_page' => -1      // Pobierz wszystkie wpisy
                                );

                                $team = new WP_Query($args_list);
                            ?>

                            <select class="custom-select" id="doctorSelect">
                                <?php $index = 0; $firstUrl = ''; while ($team->have_posts()) : 
                                    $team->the_post(); 
                                    $teamitem = $post; 

                                    $specjalisation = get_field('specjalizacja', $teamitem->ID);
                                    $url = get_field('znany_lekarz_url', $teamitem->ID);

                                    if($index == 0) $firstUrl = $url;
                                ?>
                                <option value="<?=$url?>"><?=$teamitem->post_title?></option>
                            
                                <?php $index++; endwhile; ?>

                            </select>

                            <a href="<?=$firstUrl?>" class="button" id="doctorButton"><?=__('Sprawdź terminy', 'button')?></a>
                        </div>
                        <div class="contact-section__form active" id="phone_call">
                            <p><?=__('Zostaw swój numer, a skontaktujemy się z Tobą w pierwszy dzień roboczy.', 'better')?></p>
                            <?php echo do_shortcode('[contact-form-7 id="62397d6" title="Formularz kontaktowy - telefon"]'); ?>
                        </div>
                        <div class="contact-section__form" id="message">                         
                            <?php echo do_shortcode('[contact-form-7 id="2d6077d" title="Zostaw wiadomość"]'); ?>
                    </div>
                </div>
            </div>
			</div>
        </article>

    </section>



<?php
get_footer();
