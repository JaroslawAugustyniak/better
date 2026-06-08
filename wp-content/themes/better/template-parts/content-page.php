
<?php

global $post; 


$current_page = $post;


// Upewnij się, że jesteśmy w pętli lub masz $post_id
$post_id = get_the_ID();
$page_content = split_post_content_by_more($post);

$kolor_tla_naglowka = 'colorset--color-1';
$kolor_tla_ = 'colorset--color-6';
?>



<section class="" data-waypoint-header="<?=get_header_color($kolor_tla_naglowka)?>">
        
        <div class="content-header <?=$kolor_tla_naglowka?>">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-6 col-lg-8 col-md-10 col-12">
                        <div class="content-header__category" data-waypoint-animate="true">
                            <?php if (function_exists("rank_math_the_breadcrumbs")) rank_math_the_breadcrumbs(); ?>
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

        

        <article class="content-article <?=$kolor_tla_?>"  data-waypoint-header="<?=get_header_color($kolor_tla_)?>">
            <div class="container">
				<div class="block block-type-1" data-waypoint-animate="true">
					<div class="row justify-content-center">
						<div class="col-xl-8 col-lg-10 col-12">							
								<?=$page_content['after']?>							
						</div>

					</div>
				</div>
				

			</div>
        </article>

    </section>

	

		