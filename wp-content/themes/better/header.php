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
			<a class="button d-none d-sm-block" href="/#kontakt" target="_self" id="umow_wizyte"><span><?=__('Umów wizytę', 'better') ?></span></a>

			<a class="button d-block d-sm-none" href="tel:+48 502 646 811">
				<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 1000 1000" enable-background="new 0 0 1000 1000" xml:space="preserve">
					<g><g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)"><path d="M1757.7,4998.7c-42.3-13.4-113.3-44.2-159.4-67.2c-130.6-67.2-547.3-412.9-837.3-693.3c-447.5-435.9-641.4-714.4-658.7-948.7c-19.2-232.4,80.7-733.6,217-1104.2C674.6,1236.7,1362.1,195.9,2406.8-965.9C2729.4-1325,3559-2154.6,3918.1-2477.2C5053-3497,6065.1-4174.8,7000.3-4537.8c395.6-153.6,973.6-270.8,1204.1-243.9c124.8,15.3,314.9,119,516.6,282.3c353.4,284.2,996.7,1014,1119.6,1267.4c55.7,115.2,59.5,140.2,59.5,326.5c0,180.5-5.8,211.2-51.9,297.6c-26.9,53.8-74.9,119.1-105.6,147.9c-67.2,63.3-1939.6,1307.8-2070.1,1375c-80.7,42.2-121,49.9-259.3,49.9c-251.6,0-338-34.6-1050.4-441.7l-318.8-180.5l-182.4,136.4C5506.2-1254,5129.9-914.1,4549.9-334.1C3970,247.7,3630.1,622.2,3363.1,979.4l-138.3,182.4l222.8,389.8c295.7,522.3,349.5,633.7,386,804.6c36.5,170.9,25,313-32.7,428.2c-82.6,159.4-1355.8,2060.5-1415.3,2110.5C2245.5,5012.1,1953.6,5060.1,1757.7,4998.7z M2111.1,4624.2c32.6-32.7,727.8-1075.4,1190.6-1784c169-259.2,178.6-278.4,169-353.3c-13.4-101.8-103.7-282.3-416.7-831.5c-138.3-242-261.2-455.1-270.8-474.3c-32.7-57.6,291.9-505,737.4-1013.9c107.5-121,449.4-476.2,762.4-787.4c681.7-683.6,1140.7-1086.9,1567-1375l184.4-124.8l59.5,38.4c140.2,84.5,768.1,437.9,965.9,543.5c144,74.9,245.8,117.1,307.3,122.9l94.1,11.5l1017.8-676c560.7-370.6,1029.3-689.4,1042.7-706.7c32.7-44.2,28.8-155.6-13.4-243.9c-113.3-247.7-877.6-1098.4-1154.1-1282.8c-99.9-67.2-113.3-71.1-263.1-71.1c-812.3,0-2060.5,637.6-3352.9,1714.9c-812.3,677.9-1845.4,1711-2523.3,2523.3C1135.5,1148.4,511.4,2369.7,498,3205.1c-1.9,126.7,3.8,157.5,51.9,238.1c132.5,228.5,921.8,954.4,1250.1,1152.2C1928.6,4672.2,2051.5,4683.7,2111.1,4624.2z"/></g></g>
				</svg>
			</a>
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
								'container_id'   => 'header-menu',
								'container_class'=> 'row justify-content-center',
								'walker'         => new Custom_Bootstrap_Menu_Walker(),
								'items_wrap'     => '%3$s', // 🔥 usuwa domyślne <ul> i <li>
							) );

						?>

        </div>
    </div>
<!--
    <div class="menu-module__footer d-lg-none d-block">
        <div class="menu-module__lang">
            <ul>
               
                    <li><a href="#"></a></li>
                
            </ul>
        </div>
    </div>
                            -->
</div>
