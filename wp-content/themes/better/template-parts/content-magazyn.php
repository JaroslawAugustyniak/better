
<?php

global $post; 


$current_page = $post;


// Upewnij się, że jesteśmy w pętli lub masz $post_id
$post_id = get_the_ID();


$kolor_tla_naglowka = 'colorset--color-1';
$kolor_tla_ = 'colorset--color-6';
?>



<section class="" data-waypoint-header="<?=get_header_color($kolor_tla_naglowka)?>">
        
        <div class="content-header <?=$kolor_tla_naglowka?>">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-6 col-lg-8 col-md-9 col-sm-10 col-xs-11 col-12">
                        <div class="content-header__category" data-waypoint-animate="true">
                            <?php
                                $post_tags = get_the_tags();
                                if ( $post_tags ) {
                                    echo '<div class="tags">';
                                    foreach ( $post_tags as $tag ) {
                                        echo '<a href="' . get_tag_link( $tag->term_id ) . '" class="tag-item">' . esc_html( $tag->name ) . '</a>, ';
                                    }
                                    echo '</div>';
                                }
                                ?>
                        </div>
                        <div class="content-header__title" data-waypoint-animate="true">

                                <h1 class="head-class"><?= $current_page->post_title ?></h1>

                        </div>

                        <div class="content-header__dsc" data-waypoint-animate="true">
                            <?= date('m/d/Y', strtotime($current_page->post_date))?>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        

        <article class="content-article <?=$kolor_tla_?>"  data-waypoint-header="<?=get_header_color($kolor_tla_)?>">
            <div class="container">
				<div class="block block-type-2" data-waypoint-animate="true">


					<!--<div class="row justify-content-center">
						<div class="col-xl-8 col-lg-10 col-12">
							<div class="block-photo">
								<figure>
									<?php
										displayImage($post_id, 'img-flui');
									?>
								</figure>
							</div>
						</div>
					</div>-->
                    
                    <!--/row-->


				</div>
      			<div class="block block-type-1" data-waypoint-animate="true">
					<div class="row justify-content-center">
						<div class="col-xl-8 col-lg-10 col-12">
							
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
        </article>

    </section>