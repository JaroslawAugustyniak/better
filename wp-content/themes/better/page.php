<?php
/**
 * The template for displaying all pages
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages
 * and that other 'pages' on your WordPress site may use a
 * different template.
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package Inwenta
 */

get_header();

?>
	<div class="header-size"></div>
	<main id="primary" class="site-main">

		<?php
		while ( have_posts() ) :
			the_post();
			// do_shortcode('[ajax_load_more post_type="post" posts_per_page="3"]');
			get_template_part( 'template-parts/content', 'page' );

			// If comments are open or we have at least one comment, load up the comment template.
			if ( comments_open() || get_comments_number() ) :
				comments_template();
			endif;

		endwhile; // End of the loop.
		?>

	</main><!-- #main -->

	<?php 
			$mainpage_item = get_post_by_slug_and_type('o-nas', 'mainpage');
			get_template_part( 'template-parts/template', 'news', $mainpage_item);
		?>

		<?php 
			$mainpage_item = get_post_by_slug_and_type('kontakt', 'mainpage');
			get_template_part( 'template-parts/template', 'contact', $mainpage_item);
		?>
<?php
// get_sidebar();
get_footer();
