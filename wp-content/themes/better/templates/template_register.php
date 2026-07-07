<?php

/**
 * Template Name: Register online
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
                    <div class="col-xl-8 col-lg-10 col-12 offset-xl-2 offset-lg-1 offset-0" data-waypoint-animate="true">			
							
                        <?=$page_content['after']?>
									
                    </div>
			    </div>
			</div>
        </article>

    </section>
    
    <?php 
        $mainpage_item = get_post_by_slug_and_type('kontakt', 'mainpage');
        get_template_part( 'template-parts/template', 'contact', $mainpage_item);
    ?>


<?php
get_footer();
