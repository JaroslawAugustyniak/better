
<?php

global $post; 


$current_page = $post;

$page_content = split_post_content_by_more($post);



$kolor_tla_naglowka = 'colorset--color-2'; //get_field('kolor_tla_naglowka', $current_page->ID);
$kolor_tla_ = 'colorset--color-1'; //get_field('kolor_tla_', $current_page->ID);
$koszt_uslugi = get_field('koszt_uslugi', $current_page->ID);

?>

<section class="" data-waypoint-header="<?=get_header_color($kolor_tla_naglowka)?>">
        
        <div class="content-header <?=$kolor_tla_naglowka?>">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8 col-12">
                        
                        <div class="content-header__category" data-waypoint-animate="true">
                            <?php                                
                                if (function_exists("rank_math_the_breadcrumbs")) rank_math_the_breadcrumbs();
                            ?>
                        </div>
						
						<div class="content-header__title" data-waypoint-animate="true">
                            <h1 class="head-class"><?= $current_page->post_title ?></h1>
                        </div>

                        <div class="content-header__dsc" data-waypoint-animate="true">
                            <?=$page_content['before']?>
                        </div>

                        <div class="block-photo col-5" data-waypoint-animate="true">
							<figure>
                                <?php
                                    displayImage($current_page->ID);
                                ?>
							</figure>
						</div>
                    </div>
                </div>
            </div>
        </div>

        

        <article class="content-article <?=$kolor_tla_?>"  data-waypoint-header="<?=get_header_color($kolor_tla_)?>">
            <div class="container">
					<div class="row justify-content-center">
						<div class="col-xl-8 col-lg-10 col-12" data-waypoint-animate="true">							
								<?=$page_content['after']?>							
						</div>
					</div>				

			</div>
        </article>
       

    </section>

        <?php 
        $mainpage_item = get_post_by_slug_and_type('opinie', 'mainpage');
        get_template_part( 'template-parts/template', 'opinionsmix', $mainpage_item);
    ?>
    <div class="margin"></div>
    <?php 
        $mainpage_item = get_post_by_slug_and_type('metamorfozy', 'mainpage');
        get_template_part( 'template-parts/template', 'metamorf', $mainpage_item);
    ?>
    <?php 
        $mainpage_item = get_post_by_slug_and_type('faq', 'mainpage');
        $page = get_post_by_slug_and_type('uslugi', 'page');
        $mainpage_item->current_page = $page->ID;
        get_template_part( 'template-parts/template', 'faq2', $mainpage_item);
    ?>

    <?php 
        get_template_part( 'template-parts/template', 'servicesmore', $current_page);
    ?>

    <?php 
        $mainpage_item = get_post_by_slug_and_type('magazyn', 'mainpage');
        get_template_part( 'template-parts/template', 'magazyn', $mainpage_item);
    ?>
    
    <?php 
        $mainpage_item = get_post_by_slug_and_type('kontakt', 'mainpage');
        get_template_part( 'template-parts/template', 'contact', $mainpage_item);
    ?>



				

