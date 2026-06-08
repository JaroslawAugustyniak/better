<?php

/**
 * Template Name: Magazyn
 * 
 * 
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package K5
 */

get_header(); 

    $args_list = array(
        'post_type' => 'magazyn',  // Typ wpisu 'project'
        'post_status' => 'publish', // Tylko opublikowane wpisy
        'posts_per_page' => -1      // Pobierz wszystkie wpisy
    );

    $magazynY = new WP_Query($args_list);

    global $post; 


    $current_page = $post;

?>
<section class="colorset--color-7" data-waypoint-header="page-header--color-6">
    <div class="content-header ">
        <div class="container">
            <div class="row">
                <div class="col-md-5 col-12">
                    <div class="content-header__title text-left" data-waypoint-animate="true">
                        <h1 class="head-class"><?=$current_page->post_title?></h1>
                    </div>
                    <div class="content-header__dsc text-left" data-waypoint-animate="true">
                        <?php 
                            $content = $current_page->post_content;
                            $content = apply_filters( 'the_content', $content );
                            $content = str_replace( ']]>', ']]&gt;', $content );
                            echo $content;
                            ?>
                    </div>
                    
                </div>
                <div class="col-md-5 offset-md-2 col-12 text-left">
                        <?php 
                            $static = get_post_by_slug_and_type('newsletter', 'static');
                        ?>
                        <div class="block block-type-0" data-waypoint-animate="true">
                        <p class="head-class"><?= $static->post_title ?>:</p>
                        </div>
                        <div class="newsletter_holder" data-waypoint-animate="true">
                            <?php echo apply_filters( 'the_content', $static->post_content ); ?>
                        </div>  
                </div>
            </div>
        </div>
    </div>

<?php if ($magazynY->have_posts()) : ?>
    <div class="content-news-list colorset--color-4" data-waypoint-header="<?=get_header_color('colorset--color-4')?>">
        <div class="container">

            <div class="row">

                            
                <div class="col-lg-6 col-12">                            
                    <?php $index = 0; while ($magazynY->have_posts()) : 
                        $magazynY->the_post(); 
                        $item = $post; 
                        $item->index = $index;  // Dodaj index
                        $item->showTags = true;  // Dodaj index

                        if($index%2 == 0):
                    ?>
                
                            <?php get_template_part( 'template-parts/content', 'blog-item', $item);?>
                            
                    <?php endif; $index++; endwhile; ?>
                </div>
                <div class="col-lg-6 col-12">                            
                    <?php $index = 0; while ($magazynY->have_posts()) : 
                        $magazynY->the_post(); 
                        $item = $post; 
                        $item->index = $index;  // Dodaj index
                        $item->showTags = true;  // Dodaj index
                        if($index%2 == 1):
                    ?>
                
                            <?php get_template_part( 'template-parts/content', 'blog-item', $item);?>
                            
                    <?php endif; $index++; endwhile; ?>
                </div>

            </div>
        </div>
    </div>

    <?php endif; ?>

</section>
<?php 
        $mainpage_item = get_post_by_slug_and_type('kontakt', 'mainpage');
        get_template_part( 'template-parts/template', 'contact', $mainpage_item);
    ?>

<?php
get_footer();
