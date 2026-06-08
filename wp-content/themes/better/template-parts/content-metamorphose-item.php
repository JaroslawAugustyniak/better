<?php 
    $meta = $args;
    $service_title = get_field('service_title', $meta->ID);

    if(!($service_title)) $service_title = $meta->post_title;
    $service_content = get_field('opis_uslugi_w_listach', $meta->ID);

    $doctor = get_field('doctor', $meta->ID);
    $services = get_field('dotyczy_uslugi', $meta->ID);
                        $services_list = '';
                        foreach($services as $service){
                            $services_list .= (strlen($services_list)>0?', ':'').$service->post_title;
                        }
?>
<div class="meta-item">
                                    <?php
                                        $meta->gallery_type = 'mini';
							            get_template_part( 'template-parts/template', 'gallery', $meta);		
                                    ?>

                                    <div>
                                        
                                            <h3 class="head-class">
                                                <a href="<?=get_permalink($meta->ID)?>"><?=$service_title?></a>
                                            </h3>
                                        
                                    </div>
                                    <div class="homepage-section__info"><?=$services_list?></div>
                                    <div class="homepage-section__doctor"><?=$doctor?$doctor->post_title:''?></div>
                                    <div class="homepage-section__dsc"><?=$service_content?></div>
                                    
</div>