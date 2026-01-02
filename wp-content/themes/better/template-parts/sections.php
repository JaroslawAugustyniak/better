<?php 
    
    if ($args){
        $post = $args;
    } 

    
    // Check rows exists.
    if( have_rows('sections') ):
        // Loop through rows.
        ?>

        
        <?php while( have_rows('sections') ) : the_row();

         

        $sub_value = get_sub_field('sekcja');
        
        
        
        $sectionType = get_field('typ_sekcji', $sub_value->ID);
         
?>
            <section id="<?=$sub_value->post_name?>" class="<?=$sectionType?>">
                <?php 
                    switch($sectionType){

                        default:
                            get_template_part( 'template-parts/template', $sectionType, $sub_value);
                        break;

                }
            ?>
            </section>
            <?php
            // Do something...
        
        // End loop.
        endwhile;

    // No value.
    else :
        // Do something...
    endif;

?>
