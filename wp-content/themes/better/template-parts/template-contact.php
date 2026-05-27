<?php 
    $mainpage_item = $args; 
    
    $bg = get_field('kolor_tla', $mainpage_item->ID);
    $description = get_field('opis_wysiwyg', $mainpage_item->ID);
?>


    <section id="contact" class="homepage-section contact-section <?=$bg?>" data-waypoint-header="<?=get_header_color($bg)?>">
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

        </div>
    </section>
