<?php
/**
 * The header for our theme
 *
 * This is the template that displays all of the <head> section and everything up until <div id="content">
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package Inwenta
 */

?>
<!doctype html>
<html <?php language_attributes(); ?>>
<head>

	<meta charset="<?php bloginfo( 'charset' ); ?>">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="profile" href="https://gmpg.org/xfn/11">

	<?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>
<?php wp_body_open(); ?>

<div id="is_mobile"></div>

<div id="page" class="site">
	<a class="skip-link screen-reader-text" href="#primary"><?php esc_html_e( 'Skip to content', 'fenix' ); ?></a>
	<header class="page-header">

		<div class="page-header-button">
			<a class="button" href="/#kontakt" target="_self" id="umow_wizyte"><span><?=__('Umów wizytę', 'better') ?></span></a>
		</div>

        <div class="page-header__logo">
			<a href="/">
            <svg class="img-fluid" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 540 81">
                    <g>
                        <path id="ph-logo-path" d="M484.033 10.81h22.517c11.305 0 16.2 3.71 16.2 12.788 0 8.846-5.63 13.9-16.2 13.9h-22.517V10.81zM540.065 81l-21.041-34.479c11.735-4.018 15.49-15 15.49-22.923C534.513 8.846 524.93 0 508.013 0h-35.632v81h11.65V48.085h22.39L526.508 81h13.558zM280.55 0h63.146v10.81h-25.773V81h-11.648V10.81H280.55V0zm-93.316 0h63.145v10.81h-25.77V81h-11.65V10.81h-25.725V0zm201.861 70.186h46.198V81h-57.848V0h56.041v10.81h-44.39v23.06h37.487v10.812h-37.488v25.504zm-276.918 0h46.198V81h-57.846V0h56.045v10.81h-44.397v23.06h37.487v10.812h-37.487v25.504zm-76.819.226H11.716v-26.07h22.636c9.302 0 17.211 2.509 17.211 13.06 0 11.12-7.377 13.01-16.206 13.01zM11.716 10.811h22.97c9.737 0 14.396 3.48 14.396 10.63 0 8.574-5.136 12.43-14.172 12.43H11.716V10.81zM51.934 38.36v-.257c5.864-3.175 8.91-10.31 8.91-17.57C60.845 9.414 52.278 0 35.136 0H.065v81h35.972c18.269 0 27.286-9.873 27.286-22.804 0-8.28-4.62-16.662-11.39-19.836z"/>
                    </g>
                </svg>
			</a>
        </div>


    <button class="menu-button">
        <div class="hamburger">
            <span></span>
            <span></span>
            <span></span>
        </div>
        <div class="cross">
            <span></span>
            <span></span>
        </div>
    </button>
</header>

<div class="menu-module">
    <div class="menu-module__header">
        <div class="page-header__logo">
            <a href="/">
                <svg class="img-fluid" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 540 81" preserveAspectRatio="xMinYMid">
                    <defs>
                        <style>
                            .cls-1{fill:none}
                        </style>
                        <clipPath id="menu-clip-path">
                            <path id="menu-path" class="cls-1" d="M0 0h540v81H0z" transform="translate(.065)"/>
                        </clipPath>
                    </defs>
                    <g id="menu-logo-group" transform="translate(-.065)">
                        <path id="menu-path-2" class="cls-1" d="M0 0h540v81H0z" transform="translate(.065)"/>
                        <g id="menu-logo-group-2" clip-path="url(#menu-clip-path)">
                            <path id="menu-logo-path" d="M483.968 81h-11.65V0h35.632a36.751 36.751 0 0 1 11.277 1.613 22.8 22.8 0 0 1 8.316 4.654 19.75 19.75 0 0 1 5.144 7.42 26.545 26.545 0 0 1 1.761 9.911 26.547 26.547 0 0 1-3.348 12.926 21.892 21.892 0 0 1-4.774 5.835 22.311 22.311 0 0 1-7.371 4.162L540 81h-13.557l-20.086-32.915h-22.389V81zm0-70.19V37.5h22.517c10.447 0 16.2-4.936 16.2-13.9a15.858 15.858 0 0 0-.941-5.827 9.106 9.106 0 0 0-2.92-3.971 12.858 12.858 0 0 0-5.039-2.267 31.434 31.434 0 0 0-7.3-.722zM435.227 81h-57.848V0h56.041v10.811h-44.39v23.06h37.487v10.81H389.03v25.506h46.2V81zm-117.37 0h-11.648V10.811h-25.725V0h63.146v10.811h-25.773zm-93.314 0h-11.651V10.811h-25.724V0h63.146v10.811h-25.771zm-66.235 0h-57.845V0h56.044v10.811h-44.4v23.06H149.6v10.81h-37.49v25.506h46.2V81zM35.972 81H0V0h35.07c8.05 0 14.718 2.108 19.283 6.1a18.473 18.473 0 0 1 4.82 6.537 19.566 19.566 0 0 1 1.607 7.9 23.8 23.8 0 0 1-2.257 10.313 16 16 0 0 1-6.654 7.25v.256a16.837 16.837 0 0 1 4.631 3.278 21.47 21.47 0 0 1 3.6 4.729A24.381 24.381 0 0 1 63.258 58.2c0 6.632-2.349 12.251-6.792 16.251a23.733 23.733 0 0 1-8.523 4.808A38.264 38.264 0 0 1 35.972 81zM11.651 44.342v26.07h23.641c5.338 0 8.858-.72 11.414-2.335C49.93 66.039 51.5 62.547 51.5 57.4a14.071 14.071 0 0 0-1.382-6.492 10.136 10.136 0 0 0-3.736-4c-2.794-1.731-6.75-2.573-12.094-2.573H11.651zm0-33.531v23.06h23.194c9.4 0 14.171-4.182 14.171-12.43a11.543 11.543 0 0 0-.88-4.677 8.23 8.23 0 0 0-2.667-3.318 12.415 12.415 0 0 0-4.492-1.979 27.358 27.358 0 0 0-6.358-.655H11.651z" transform="translate(.065)"/>
                        </g>
                    </g>
                </svg>
            </a>
        </div>



        <button class="menu-button">
            <div class="hamburger">
                <span></span>
                <span></span>
            </div>
            <div class="cross">
                <span></span>
                <span></span>
            </div>
        </button>
    </div>


    <div class="menu-module__content section">

        <div class="container">

               <?php
							wp_nav_menu( array(
								'theme_location' => 'menu-1',
								'container'      => 'div',
								'container_id'   => 'top-header-menu',
								'container_class'=> 'justify-content-center',
								//'walker'         => new Custom_Bootstrap_Menu_Walker(),
								///'items_wrap'     => '%3$s', // 🔥 usuwa domyślne <ul> i <li>
							) );

						?>

        </div>
    </div>

    <div class="menu-module__footer d-lg-none d-block">
        <div class="container">
        <div class="page-header_button">
			<a class="button" href="/#kontakt" target="_self" id="umow_wizyte"><span><?=__('Umów wizytę', 'better') ?></span></a>
		</div>
        <div class="menu-module__sociale">
            <?php 
                $static = get_post_by_slug_and_type('sociale', 'static');
   
                echo apply_filters( 'the_content', $static->post_content ); 
            ?>
                        
        </div>
        </div>
    </div>

</div>
