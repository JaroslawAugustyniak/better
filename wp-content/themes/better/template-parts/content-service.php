
<?php

global $post; 


$current_page = $post;

$page_content = split_post_content_by_more($post);



$kolor_tla_naglowka = 'colorset--color-2'; //get_field('kolor_tla_naglowka', $current_page->ID);
$kolor_tla_ = 'colorset--color-1'; //get_field('kolor_tla_', $current_page->ID);
$koszt_uslugi = get_field('koszt_uslugi', $current_page->ID);
$posts = get_child_posts_of_current( $current_page );
?>

<section class="" data-waypoint-header="<?=get_header_color($kolor_tla_naglowka)?>">
        
        <div class="content-header <?=$kolor_tla_naglowka?>">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8 col-12">
                        
						<div class="block-photo col-6">
								<figure>
									<?php
										displayImage($current_page->ID);
									?>
								</figure>
							</div>
						
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

        

        <article class="content-article <?=sizeof($page_content['after_segments']) > 1 || $posts ?'with-segments':''?> <?=$kolor_tla_?>"  data-waypoint-header="<?=get_header_color($kolor_tla_)?>">

            <?php $key=0; if(sizeof($page_content['after_segments']) > 1): ?>

                <?php foreach ($page_content['after_segments'] as $key=>$segment): ?>


                    <div class="segment <?=$key%2?$kolor_tla_naglowka:''?>">
                        <div class="container">
	
                            <div class="block block-type-1" data-waypoint-animate="true">
                                <div class="row justify-content-center">
                                    <div class="col-xl-8 col-12">
                                        
                                        <?=$segment?>

                                    </div>

                                </div>
                            </div>				

                        </div>
                    </div>


                <?php endforeach; ?>

            <?php else: ?>

            

            <div class="container">
	
      			<div class="block block-type-1" data-waypoint-animate="true">
					<div class="row justify-content-center">
						<div class="col-xl-8 col-12">
							
							<?=$page_content['after']?>

						</div>

					</div>
				</div>				

			</div>
<?php endif; ?>
       

        <?php 
            
            
            if($posts):    
        ?>
        <div class="connected-articles">           
<div class="container">
                <div class="row justify-content-center">
                <div class="col-xl-8 col-12">
                    <h2><?=__('Przeczytaj także:', 'better')?></h2>
                <ul class="connected-posts">
                    <?php foreach ($posts as $connected_post): ?>
                        <li class="connected-post">
                            <a href="<?=get_permalink($connected_post->ID)?>">
                                    <?=$connected_post->post_title?>
                                    
                            </a>
                    </li>
                    <?php endforeach; ?>
                    </ul>
                </div>
                </div>
            </div>
        </div>

        <?php endif; ?>
        </article>
    </section>

	<?php get_template_part( 'template-parts/template', 'opinions'); ?>


				

