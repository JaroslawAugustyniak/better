<?php 
    $item = $args;
    $krotki_opis = get_field('krotki_opis', $item->ID);
    $naglowek = get_field('naglowek', $item->ID);

    $index = $item->index;
    $showTags = $item->showTags;
?>

<div class="news-slide"  data-waypoint-animate="true" 
                             data-index="<?= $index ?>" 
                             data-news-id="<?=$item->ID?>" 
                             data-title="<?=$item->post_title?>"
                             data-url="<?=get_permalink($item->ID)?>">
                            
                            
                        
                             
                                <div class="news-image-container">
                                    <a href="<?=get_permalink($item->ID)?>" class="news-card">
                                        <?php displayImage($item->ID); ?>
                                    </a>
                                </div>
                                
                                <div class="news-content">
                                    <?php
                                    if($showTags):
                                        $post_tags = get_the_tags();
                                        if ( $post_tags ) {
                                            echo '<div class="tags">';
                                            foreach ( $post_tags as $tag ) {
                                                echo '<a href="' . get_tag_link( $tag->term_id ) . '" class="tag-item">' . esc_html( $tag->name ) . '</a>, ';
                                                }
                                                echo '</div>';
                                                }
                                                
                                                ?>
                                    <div class="date"><?= date('m/d/Y', strtotime($item->post_date))?></div>
                                    <?php 
                                    endif;
                                    ?>


                                    <a href="<?=get_permalink($item->ID)?>" class="news-card">
                                        <h3 class="news-title"><?=$naglowek ? $naglowek : $item->post_title?></h3>
                                        <div class="news-excerpt <?php if($showTags):?>show-all<?php endif; ?>"><?=$krotki_opis?></div>
                                    </a>
                                    <?php if(!$showTags): ?>
                                    <div class="news-meta"> 
                                        <a href="<?=get_permalink($item->ID)?>" class="news-card">                                       
                                            <span class="button">
                                                <?=__('Czytaj więcej', 'better')?>                                            
                                            </span>
                                        </a>
                                    </div>
                                    <?php endif; ?>
                                </div>
                            
                            </div>