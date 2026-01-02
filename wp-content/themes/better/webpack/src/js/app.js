global.$ = global.jQuery = require('jquery');

// ---- Bootstrap
require('bootstrap');

// ---- Masonry
var jQueryBridget = require('jquery-bridget');
var Masonry = require('masonry-layout');
jQueryBridget( 'masonry', Masonry, $ );
require('imagesloaded');

// ---- JQuery Validation
require('jquery-validation');

// ---- Easy Responsive Tabs
require('easy-responsive-tabs');

// ---- Lightgallery
require('lightgallery');
require('lg-thumbnail');
require('lg-autoplay');
require('lg-video');
require('lg-fullscreen');
require('lg-pager');
require('lg-zoom');
require('lg-hash');
require('lg-share');

// ---- Slick
require('slick-carousel');

// ---- Dropzone
global.Dropzone = require('dropzone');
Dropzone.autoDiscover = false;

// ---- Webfontloader
//global.WebFont = require('webfontloader');

// WebFont.load({
//     google: {
//         families: ['Open Sans:300,400,700:latin,latin-ext']
//     }
// });

// ---- jQuery.lazy
// require('jquery-lazy');??

// ---- AOS
// global.AOS = require('aos');
// AOS.init({
//     // Global settings
//     disable: false, // accepts following values: 'phone', 'tablet', 'mobile', boolean, expression or function
//     //startEvent: 'DOMContentLoaded', // name of the event dispatched on the document, that AOS should initialize on
//     //initClassName: 'aos-init', // class applied after initialization
//     //animatedClassName: 'aos-animate', // class applied on animation
//     //useClassNames: false, // if true, will add content of `data-aos` as classes on scroll
//
//     // Settings that can be overriden on per-element basis, by `data-aos-*` attributes:
//     offset: 60, // offset (in px) from the original trigger point
//     //delay: 0, // values from 0 to 3000, with step 50ms
//     duration: 1000, // values from 0 to 3000, with step 50ms
//     //easing: 'ease', // default easing for AOS animations
//     //once: false, // whether animation should happen only once - while scrolling down
//     //mirror: false, // whether elements should animate out while scrolling past them
//     //anchorPlacement: 'top-bottom', // defines which position of the element regarding to window should trigger the animation
// });

// ---- Multi Level Menu
// require('../../node_modules/multilevelmenu/src/multilevelmenu.js');

// ---- Waypoints
require('../../node_modules/waypoints/lib/jquery.waypoints.js');

// ---- Select2
global.select2 = require('select2')($);
//require('select2/i18n/pl'); ??

// ---- Counter-Up2 //alt: countimator
// require('counterup2');??

// ---- Swup
global.Swup = require( 'swup' ).default;
//global.SwupDebugPlugin = require('@swup/debug-plugin').default;
global.SwupScrollPlugin = require('@swup/scroll-plugin').default;
global.SwupPreloadPlugin = require('@swup/preload-plugin').default;
global.SwupScriptsPlugin = require('@swup/scripts-plugin').default;

// ---- Misc
require('./include/validations.js');
require('./include/infoCookie.js');
//require('./include/parallax.js');
require('./include/functions.js');