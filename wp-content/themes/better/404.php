<?php
/**
 * The template for displaying 404 pages (not found)
 *
 * @link https://codex.wordpress.org/Creating_an_Error_404_Page
 *
 * @package Inwenta
 */

get_header();

$kolor_tla_naglowka = 'colorset--color-1';
?>
<div class="header-size"></div>
	<main id="primary" class="site-main pt-5">

		<section class="error-404 not-found mt-5 p-5 <?=$kolor_tla_naglowka?>" data-waypoint-header="<?=get_header_color($kolor_tla_naglowka)?>">
			<div class="container">
				<div class="row">
					<div class="offset-md-3 col-md-6">
						<h1 class="page-title">404</h1>
						<p><?php esc_html_e( 'Strona, której szukasz nie istnieje lub została usunięta.', 'better' ); ?></p>
					</div>
				</div>
				<div class="row">
					<div class="offset-md-3 col-md-6">
						<img src="<?=get_template_directory_uri().'/images/graphic.png'?>" class="img-fluid" />
					</div>
				</div>
				<div class="row">
					<div class="offset-md-3 col-md-6">
						<a href="/" class="link"><?php esc_html_e( 'Wróć do strony głównej', 'better' ); ?></a>
					</div>
				</div>
			</div>
			

			</div><!-- .page-content -->
		</section><!-- .error-404 -->

	</main><!-- #main -->

<?php
get_footer();
