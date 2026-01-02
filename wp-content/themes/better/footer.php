<?php
/**
 * The template for displaying the footer
 *
 * Contains the closing of the #content div and all content after.
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package Inwenta
 */

?>
	<section id="kontakt" class="contact-section section colorset--color-3" data-waypoint-header="page-header--color-3">
		<div class="container">

			<div class="row">
            <div class="col-3">
                <div class="contact-section__header animate" data-waypoint-animate="true">
                    Kontakt
                </div>
            </div>
            <div class="col-xl-6 col-lg-9 col-12">
                <div class="contact-section__title animate" data-waypoint-animate="true">
                    <p class="head-class">W czym możemy pomóc?<br>
                        <span class="head-class d-none d-sm-block">Napisz lub zadzwoń: <a href="tel:+48 502 646 811">+48 502 646 811</a></span>
                    </p>
                </div>
                <div class="contact-section__dsc animate" data-waypoint-animate="true"><p>Profilaktyka, leczenie, przywrócenie zdrowego uśmiechu? Prosimy o krótki opis problemu, który możemy rozwiązać. Skontaktujemy się i umówimy Państwa na wizytę.</p></div>
                <div class="contact-section__form animate" data-waypoint-animate="true">
                    
                        <?php echo do_shortcode('[contact-form-7 id="2d6077d" title="Formularz kontaktowy"]'); ?>
                    
                </div>
            </div>
        </div>


		</div>
	</section>


	
	<footer class="page-footer colorset--color-4">
    <div class="container">
        <div class="row">
            <div class="col-6">
                <div class="row">
                    <div class="col-sm-4 col-12">
                        <div class="page-footer__logo">
                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="42" height="55" viewBox="0 0 42 55">
                            <defs>
                                <clipPath id="footer-logo-clip-path">
                                    <path d="M0,0H42V55H0Z" transform="translate(0.438)" fill="none"/>
                                </clipPath>
                            </defs>
                            <g transform="translate(-0.438)">
                                <path d="M0,0H42V55H0Z" transform="translate(0.438)" fill="none"/>
                                <g clip-path="url(#footer-logo-clip-path)">
                                    <path id="f-logo-path" d="M21,55A20.965,20.965,0,0,1,0,34.117V21.18H.006c0-.045,0-.09,0-.135s0-.109,0-.163A20.965,20.965,0,0,1,21,0c.207,0,.421.005.636.015A20.948,20.948,0,0,1,36.05,6.337,20.693,20.693,0,0,1,42,20.882V34.117A20.966,20.966,0,0,1,21,55ZM2.708,31.138v2.979a18.292,18.292,0,0,0,36.583,0V31.138a21.056,21.056,0,0,1-36.583,0ZM17.8,21.563V38.785a18.4,18.4,0,0,0,3.2.285c5.348,0,8.8-3.436,8.8-8.753,0-6.047-4.422-8.754-8.8-8.754ZM15.088,3.674A18.365,18.365,0,0,0,6.2,10.207,18.093,18.093,0,0,0,3.785,27.043a18.207,18.207,0,0,0,4.433,6.842,18.547,18.547,0,0,0,6.868,4.2ZM30.472,5.326a11.292,11.292,0,0,1,1.265,5.351,11.682,11.682,0,0,1-1.444,5.908,9.442,9.442,0,0,1-3.646,3.569,10.448,10.448,0,0,1,4.288,4.029,11.95,11.95,0,0,1,1.577,6.133,12.425,12.425,0,0,1-1.241,5.6,18.277,18.277,0,0,0,4.145-3.842,18.09,18.09,0,0,0,1.447-20.242A18.414,18.414,0,0,0,30.472,5.326ZM21,2.694a18.508,18.508,0,0,0-3.2.284V18.869H21c5.927,0,8.03-4.413,8.03-8.192a8.342,8.342,0,0,0-1.807-5.333A7.6,7.6,0,0,0,21.54,2.706l-.082,0-.084,0h-.02C21.246,2.7,21.124,2.694,21,2.694Z" transform="translate(0.438)" fill="#8bacad"/>
                                </g>
                            </g>
                        </svg>
                        </div>
                    </div>
                    <div class="col-sm-6 col-10">
                        <div class="row">
                            <div class="col-xl-4">
                                <?php wp_nav_menu( array(
								'theme_location' => 'footer-1',
								'container'      => 'div',
								'container_id'   => 'footer-menu',
								'container_class'   => 'page-footer__menu',
							    ) );?>
                            </div>
                            <div class="col-xl-8">
                                <?php wp_nav_menu( array(
								'theme_location' => 'footer-2',
								'container'      => 'div',
								'container_id'   => 'footer-menu-2',
								'container_class'   => 'page-footer__menu',
							    ) );?>
                            </div>
                            </div>
                        
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="row">
                    <div class="col-sm-8 col-12">
                        <div class="row">
                            <div class="col-xl-6 col-12">
                                <div class="block block-type-0">
                                    <p class="head-block"><?=__('Adres', 'better')?>:</p>
                                </div>
                                <div class="block block-type-1">
                                    <p>
                                        Better<br>
                                        ul. Kopernika 8/18<br>
                                        00-367 Warszawa
                                    </p>
                                </div>


                            </div>
                            <div class="col-xl-6 col-12">
                                <div class="block block-type-0">
                                    <p class="head-block"><?=__('Kontakt', 'better')?>:</p>
                                </div>
                                <div class="block block-type-1">
                                    <p>
                                        <a href="tel:+48502646811">+48 502 646 811</a><br>
                                        <a href="mailto:kontakt@better.clinic">kontakt@better.clinic</a><br>
                                        Otwarte: 9.00-20.00
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-12">
                        <div class="block block-type-0">
                            <p class="head-block"><?=__('Social', 'better')?>:</p>
                        </div>
                        <div class="block block-type-1">
                            <p>
                                <a target="_blank" href="https://www.instagram.com/better.clinic/">Instagram</a><br>
                                <a target="_blank" href="https://www.facebook.com/betterclinicwarsaw">Facebook</a><br>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
</div><!-- #page -->
<script  type="text/javascript">
    var lang_email_rq = 'Proszę podać adres e-mail';
    var lang_message_rq = 'Proszę wpisać treść wiadomości';
    var lang_agreement_rq = 'Zgoda na przetwarzanie danych jest wymagana';
    var lang_post_code_err = 'Niepoprawny kod pocztowy';
    var lang_email_err = 'Wpisz poprawny adres email.';
</script>

<?php wp_footer(); ?>


	<div id="cookieAcceptBar" class="cookieAcceptBar">
		<div class="container">
			<div class="row">
				<div class="col-md-10">
					Nasza strona internetowa działa zgodnie z przepisami prawa dotyczącymi ochrony danych osobowych. 
					Wchodząc na stronę bez zmiany ustawień przegladarki, wyrażają Państwo zgodę na zapisanie plików 
					cookies w pamięci swojego urządzenia i dostęp do informacji zapisanych w tych plikach
				</div>
				<div class="col-md-2 valign-center align-center">	
					<button id="cookieAcceptBarConfirm" class="btn btn-success">Akceptuję</button>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
