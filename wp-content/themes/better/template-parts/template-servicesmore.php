

<?php 
    $service = $args; 

    $bg = 'colorset--color-2';

    $related = get_field('zobacz_takze', $service->ID);
?>
<?php if ($related) : ?>

<section id="instagram" class="homepage-section instagram-section <?=$bg?>" data-waypoint-header="<?=get_header_color($bg)?>">
    <div class="container">
        
                <div class="homepage-section__top">
                    <div class="row">
                        <div class="col-lg-4 col-12">
                            <div data-waypoint-animate="true">
                                <h2 class="homepage-section__header">
                                    <?=__('Oferta', 'better') ?>
                                </h2>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="homepage-section__description" data-waypoint-animate="true"><?=__('Zobacz również', 'better') ?></div>
                        </div>
                    </div>
                </div>
            
          
                <div class="related-container" data-waypoint-animate="true">
                    <div class="row">
                    <?php
                        $index = 0;
                        foreach ($related as $related_item) :
                            
                        ?>

                        <div class="col-lg-4 col-md-6">
                        <div class="related_item">

                            <figure>
                                <?php
                                    displayImage($related_item->ID);
                                ?>
							</figure>

                            <div class="content">
                                <h3><?=$related_item->post_title?></h3>
                                <a href="<?=get_permalink($related_item->ID)?>" class="link"><?=__('Czytaj więcej', 'better')?></a>
                            </div>

                        </div>
                        </div>

                        <?php
                    $index++;
                endforeach;
                wp_reset_postdata();
                ?>
                    </div>
                </div>
            
        
    </div>
</section>

<?php endif; ?>