<?php
/**
 * The template for displaying 404 pages (not found)
 *
 * @link https://codex.wordpress.org/Creating_an_Error_404_Page
 *
 * @package Inwenta
 */

get_header();
?>
<div class="header-size"></div>
	<main id="primary" class="site-main">

		<section class="error-404 not-found">
			<div class="container">
				<div class="row">
					<div class="offset-md-2 col-md-4">
						<img src="<?=get_template_directory_uri().'/images/404.svg'?>" class="img-fluid" />
					</div>
				</row>
				<div class="row">
					<div class="offset-md-6 col-md-4">
						<h1 class="page-title"><?php esc_html_e( 'The page you are looking for does not exist', 'inwenta' ); ?></h1>
						<p><?php esc_html_e( 'Check if we have what you are looking for or contact us and we will answer your question', 'inwenta' ); ?></p>
					</div>
				</div>
			</div>
			

			</div><!-- .page-content -->
		</section><!-- .error-404 -->

	</main><!-- #main -->

<?php
get_footer();
