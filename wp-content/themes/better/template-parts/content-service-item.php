<?php 
    $service = $args;
    $service_title = get_field('service_title', $service->ID);
    $service_content = get_field('opis_uslugi_w_listach', $service->ID);
?>
<div class="service-item">
                                    <figure class="fill-box">
                                        <a href="<?=get_permalink($service->ID)?>">
                                        <?php
                                            displayImage($service->ID);
                                        ?>
                                        </a>
                                    </figure>

                                    <div>
                                        
                                            <h3 class="head-class">
                                                <a href="<?=get_permalink($service->ID)?>"><?=$service_title?></a>
                                            </h3>
                                        
                                    </div>
                                    <div class="homepage-section__dsc"><?=$service_content?></div>
                                    <div class="homepage-section__buttons">
                                        <a href="#kontakt_znany_lekarz" class="button makeAnAppoinment"><?=__('Umów wizytę', 'better')?></a>    
                                        <a href="<?=get_permalink($service->ID)?>" class="link"><?=__('Dowiedz sie więcej', 'better')?></a>
                                    </div>
                            
                                    

                                
                                

                                </div>