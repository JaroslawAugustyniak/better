var w = window,
    d = document,
    e = d.documentElement,
    g = d.getElementsByTagName('body')[0];
var x, y;

jQuery.expr[':'].regex = function (elem, index, match) {
    var matchParams = match[3].split(','),
            validLabels = /^(data|css):/,
            attr = {
                method: matchParams[0].match(validLabels) ?
                        matchParams[0].split(':')[0] : 'attr',
                property: matchParams.shift().replace(validLabels, '')
            },
            regexFlags = 'ig',
            regex = new RegExp(matchParams.join('').replace(/^\s+|\s+$/g, ''), regexFlags);
    return regex.test(jQuery(elem)[attr.method](attr.property));
}


$(function () {
    x = w.innerWidth || e.clientWidth || g.clientWidth;
    y = w.innerHeight || e.clientHeight || g.clientHeight;

    var swup = new Swup({
        plugins: [new SwupPreloadPlugin(),new SwupScrollPlugin({
            doScrollingRightAway: true,
            animateScroll: false
        })],//new SwupScriptsPlugin() //new SwupDebugPlugin(),
        linkSelector: 'a[href^="' + window.location.origin + '"]:not([data-no-swup]), a[href^="/"]:not([data-no-swup]), a[href^="./"]:not([data-no-swup]), a[href^="#"]:not([data-no-swup]), a[data-swup]'
    });

    swup.on('pageView', function () {
        window.dispatchEvent(new Event('load'));
        Waypoint.refreshAll();
    })
});

window.addEventListener("load",function(event) {

    x = w.innerWidth || e.clientWidth || g.clientWidth;
    y = w.innerHeight || e.clientHeight || g.clientHeight;

//    baguetteBox.run('.baguetteGallery', {
//        filter: /.+\.(gif|jpe?g|png|webp)\?bg_box/i
//    });

    if (hash != '' && $(hash).length > 0) {
        var sectionHeight = $(hash).innerHeight();
        var topOfset = 0; //wysokość headera

        if (sectionHeight > 0) {

            $('.navbar-collapse').removeClass('in');

            if ($('.menu-module').hasClass('menu-module--open')) {
                $('.menu-module').animate({opacity: 0}, 500, function () {
                    $(this).removeClass('menu-module--open');
                });
                $('.menu-button').removeClass('open');
            }

            if (x < 768) {
                topOfset = 0;
            }

            if (sectionHeight < y) {
                topOfset = Math.max(parseInt((y - sectionHeight) / 2), topOfset);
            }
        }

        $('html, body').animate({
            scrollTop: $(hash).offset().top - topOfset
        }, 500);
    }

    $(document).imagesLoaded().progress(function () {
        Waypoint.refreshAll();
    });

    $('.baguetteGallery').lightGallery({
        selector: 'a:regex(href,.+\\.(gif|jpe?g|png|webp)\\?bg_box)',
        share: false,
        download: false,
        showThumbByDefault: false,
        getCaptionFromTitleOrAlt: true
    });

//    $('.block-type-7').lightGallery({
//        selector: 'a:regex(href,.+\\.(gif|jpe?g|png|webp)\\?bg_box)',
//        share: false,
//        download: false,
//        showThumbByDefault: false,
//        getCaptionFromTitleOrAlt: true
//    });

    $(".block-tab").easyResponsiveTabs({
        type: 'default', //Types: default, vertical, accordion
        tabidentify: 'block-tabs-id' // The tab groups identifier *This should be a unique name for each tab group and should not be defined in any styling or css file.
    });

    // Funkcja pokazująca zakładki rozwijane
    $('.block-slide-header').click(function () {
        $(this).next().slideToggle();
        var ico_obj = $(this).children('i');

        if (ico_obj.hasClass('fa-chevron-down')) {
            ico_obj.removeClass('fa-chevron-down');
            ico_obj.addClass('fa-chevron-up');
        } else {
            ico_obj.removeClass('fa-chevron-up');
            ico_obj.addClass('fa-chevron-down');
        }
    });

    // Menu bootstrap - 3 + więcej poziomów
    $('ul.dropdown-menu [data-toggle=dropdown]').on('click', function (event) {
        event.preventDefault();
        event.stopPropagation();
        $(this).parent().siblings().removeClass('open');
        $(this).parent().toggleClass('open');
    });

    // Scroll to Top
    $(window).scroll(function () {
        if ($(this).scrollTop() >= 50) {
            $('#return-to-top').stop(true, false).fadeIn(200);
        } else {
            $('#return-to-top').stop(true, false).fadeOut(200);
        }
    });
    $('#return-to-top').click(function () {
        $('body,html').animate({
            scrollTop: 0
        }, 500);
    });

    // Fluid link - extended offset
    $('.fluid-link').on('click touchend', function () {

        $('.navbar-collapse').removeClass('in');

        if($('.menu-module').hasClass('menu-module--open')) {
            $('.menu-module').animate({opacity: 0}, 500, function () {
                $(this).removeClass('menu-module--open');
            });
            $('.menu-button').removeClass('open');
        }

        var link = $(this).attr('href');

        if($(link).length > 0) {

            var topOfset = 0; //wysokość headera
            var sectionHeight = $(link).innerHeight();

            var x = window.innerWidth || document.documentElement.clientWidth || document.getElementsByTagName('body')[0].clientWidth;
            var y = window.innerHeight || document.documentElement.clientHeight || document.getElementsByTagName('body')[0].clientHeight;

            if (sectionHeight < y) {
                topOfset = parseInt((y - sectionHeight) / 2);
            }

            if (x < 768) {
                topOfset = 0;
            }

            $('html, body').animate({
                scrollTop: $(link).offset().top - topOfset
            }, 500);
        }

        return false;
    });

    // Detect objectFit support
    if ('objectFit' in document.documentElement.style === false) {
        var container = document.getElementsByClassName('fit-box');
        for (var i = 0; i < container.length; i++) {
            var imageSource = container[i].querySelector('img').src;
            container[i].querySelector('img').style.opacity = 0;
            container[i].style.backgroundSize = 'contain';
            container[i].style.backgroundImage = 'url(' + imageSource + ')';
            container[i].style.backgroundPosition = 'center center';
        }
    }
    // Detect objectFit support
    if ('objectFit' in document.documentElement.style === false) {
        var container = document.querySelectorAll('.fill-box,.block-photo figure,.news-block-photo figure');
        for (var i = 0; i < container.length; i++) {
            var imageSource = container[i].querySelector('img').src;
            container[i].querySelector('img').style.opacity = 0;
            container[i].style.backgroundSize = 'cover';
            container[i].style.backgroundImage = 'url(' + imageSource + ')';
        }
    }

    $('.block-gallery-type-1').each(function() {
    var idBlock = '#' + $(this).attr('id');
    $(idBlock + ' .block-gallery-slider').on('init', function (event, slick) {
        $(idBlock + ' .block-gallery-slider').lightGallery({
            selector: 'a:regex(href,.+\\.(gif|jpe?g|png|webp)\\?bg_box)',
            share: false,
            download: false,
            showThumbByDefault: false,
            getCaptionFromTitleOrAlt: true
        });
    });
    $(idBlock + ' .block-gallery-slider').slick({
        speed: 300,
        slidesToShow: 1,
        slidesToScroll: 1,
        adaptiveHeight: false,
        autoplay: false,
        autoplaySpeed: 5000,
        arrows: true,
        //appendArrows: '#gallery-slick-arrows',
        prevArrow: '<button class="arrow arrow-left"><i class="fa fa-chevron-left"></i></button>',
        nextArrow: '<button class="arrow arrow-right"><i class="fa fa-chevron-right"></i></button>',
        dots: false,
        fade: true,
        draggable: false,
        swipe: false,
        infinite: true,
        asNavFor: idBlock + ' .block-gallery-thumbs',
        zIndex: 1,
        lazyLoad: 'ondemand',
        responsive: [
            {
                breakpoint: 1660,
                settings: {
                    //slidesToShow: 4
                }
            },
            {
                breakpoint: 1280,
                settings: {
                    //slidesToShow: 4
                }
            },
            {
                breakpoint: 992,
                settings: {
                    //slidesToShow: 3
                }
            },
            {
                breakpoint: 768,
                settings: {
                    //slidesToShow: 3
                }
            },
            {
                breakpoint: 480,
                settings: {
                    //arrows: false
                    //slidesToShow: 1
                }
            }
        ]
    });
    $(idBlock + ' .block-gallery-thumbs').slick({
        speed: 300,
        slidesToShow: 5,
        slidesToScroll: 1,
        adaptiveHeight: false,
        autoplay: false,
        autoplaySpeed: 5000,
        arrows: false,
        //appendArrows: '#article-gallery-arrows',
        //prevArrow: '<button class="arrow arrow-left"><i class="fa fa-angle-left"></i></button>',
        //nextArrow: '<button class="arrow arrow-right"><i class="fa fa-angle-right"></i></button>',
        dots: false,
        fade: false,
        draggable: true,
        infinite: true,
        asNavFor: idBlock + ' .block-gallery-slider',
        focusOnSelect: true,
        zIndex: 1,
        lazyLoad: 'ondemand',
        responsive: [
            {
                breakpoint: 1660,
                settings: {
                    //slidesToShow: 4
                }
            },
            {
                breakpoint: 1280,
                settings: {
                    //slidesToShow: 4
                }
            },
            {
                breakpoint: 992,
                settings: {
                    slidesToShow: 4
                }
            },
            {
                breakpoint: 768,
                settings: {
                    //autoplay: true,
                    //arrows: false,
                    slidesToShow: 4
                }
            },
            {
                breakpoint: 480,
                settings: {
                    //autoplay: true,
                    //arrows: false,
                    slidesToShow: 3
                }
            }
        ]
    });
});
    $('.block-gallery-type-2').each(function() {
    var idBlock = '#' + $(this).attr('id');
    $(idBlock + ' .block-gallery-slider').on('init', function (event, slick) {
        $(idBlock + ' .block-gallery-slider').lightGallery({
            selector: 'a:regex(href,.+\\.(gif|jpe?g|png|webp)\\?bg_box)',
            share: false,
            download: false,
            showThumbByDefault: false,
            getCaptionFromTitleOrAlt: true
        });
    });
    $(idBlock + ' .block-gallery-slider').slick({
        speed: 300,
        slidesToShow: 3,
        slidesToScroll: 1,
        adaptiveHeight: false,
        autoplay: false,
        autoplaySpeed: 5000,
        arrows: true,
        //appendArrows: '#gallery-slick-arrows',
        prevArrow: '<button class="arrow arrow-left"><i class="fa fa-chevron-left"></i></button>',
        nextArrow: '<button class="arrow arrow-right"><i class="fa fa-chevron-right"></i></button>',
        dots: false,
        fade: false,
        draggable: true,
        swipe: true,
        infinite: false,
        zIndex: 1,
        lazyLoad: 'ondemand',
        responsive: [
            {
                breakpoint: 1660,
                settings: {
                    //slidesToShow: 4
                }
            },
            {
                breakpoint: 1280,
                settings: {
                    //slidesToShow: 4
                }
            },
            {
                breakpoint: 992,
                settings: {
                    //slidesToShow: 3
                }
            },
            {
                breakpoint: 768,
                settings: {
                    //slidesToShow: 3
                }
            },
            {
                breakpoint: 480,
                settings: {
                    //arrows: false
                    //slidesToShow: 1
                }
            }
        ]
    });
});
    $('.block-gallery-type-3').each(function() {
    var idBlock = '#' + $(this).attr('id');
    $(idBlock + ' .block-gallery-slider').on('init', function (event, slick) {
        $(idBlock + ' .block-gallery-slider').lightGallery({
            selector: 'a:regex(href,.+\\.(gif|jpe?g|png|webp)\\?bg_box)',
            share: false,
            download: false,
            showThumbByDefault: false,
            getCaptionFromTitleOrAlt: true
        });
    });
    $(idBlock + ' .block-gallery-slider').slick({
        speed: 300,
        slidesToShow: 1,
        slidesToScroll: 1,
        adaptiveHeight: false,
        autoplay: false,
        autoplaySpeed: 5000,
        arrows: true,
        //appendArrows: '#gallery-slick-arrows',
        prevArrow: '<button class="arrow arrow-left"><i class="fa fa-chevron-left"></i></button>',
        nextArrow: '<button class="arrow arrow-right"><i class="fa fa-chevron-right"></i></button>',
        dots: false,
        fade: true,
        draggable: true,
        swipe: true,
        infinite: false,
        zIndex: 1,
        lazyLoad: 'ondemand',
        responsive: [
            {
                breakpoint: 1660,
                settings: {
                    //slidesToShow: 4
                }
            },
            {
                breakpoint: 1280,
                settings: {
                    //slidesToShow: 4
                }
            },
            {
                breakpoint: 992,
                settings: {
                    //slidesToShow: 3
                }
            },
            {
                breakpoint: 768,
                settings: {
                    //slidesToShow: 3
                }
            },
            {
                breakpoint: 480,
                settings: {
                    //arrows: false
                    //slidesToShow: 1
                }
            }
        ]
    });
});
    $('.block-gallery-type-4').each(function() {
    var idBlock = '#' + $(this).attr('id');
    $(idBlock).lightGallery({
        selector: 'a:regex(href,.+\\.(gif|jpe?g|png|webp)\\?bg_box)',
        share: false,
        download: false,
        showThumbByDefault: false,
        getCaptionFromTitleOrAlt: true
    });
});
    $('.block-gallery-type-5').each(function() {
    var idBlock = '#' + $(this).attr('id');
    var $gallery = $(idBlock + ' .grid').masonry({
        // options
        columnWidth: '.grid-sizer',
        itemSelector: '.grid-item',
        percentPosition: true
    });
    $gallery.imagesLoaded().progress(function () {
        $gallery.masonry('layout');
        Waypoint.refreshAll();
    });
    $gallery.on('layoutComplete', function () {
        $(idBlock).lightGallery({
            selector: 'a:regex(href,.+\\.(gif|jpe?g|png|webp)\\?bg_box)',
            share: false,
            download: false,
            showThumbByDefault: false,
            getCaptionFromTitleOrAlt: true
        });
        Waypoint.refreshAll();
    });
});
    $('.block-gallery-type-6').each(function() {
    var idBlock = '#' + $(this).attr('id');
    var $gallery = $(idBlock + ' .block-gallery-row').masonry({
        // options
        itemSelector: '.row-item',
        columnWidth: '.row-sizer',
        percentPosition: true
    });
    $gallery.imagesLoaded().progress(function () {
        $gallery.masonry('layout');
        Waypoint.refreshAll();
    });
    $gallery.on('layoutComplete', function () {
        $(idBlock).lightGallery({
            selector: 'a:regex(href,.+\\.(gif|jpe?g|png|webp)\\?bg_box)',
            share: false,
            download: false,
            showThumbByDefault: false,
            getCaptionFromTitleOrAlt: true
        });
        Waypoint.refreshAll();
    });
});

    $('.slick-slider').on('setPosition', function(event, slick){
        Waypoint.refreshAll();
        //AOS.refresh();
    });

    $('.custom-select').each(function () {
        var theme = 'default';

        if ($(this).parents('[class*="colorset"]').length > 0) {
            theme = $(this).parents('[class*="colorset"]').attr("class").match(/colorset[\w-]*\b/);
        }

        $(this).select2({
            minimumResultsForSearch: -1,
            theme: theme,
            width: '100%'
        });
    });

    var waypointsAnimation = $('[data-waypoint-animate]').waypoint(function (direction) {
        if (direction === "up") {
            $(this.element).removeClass("animate");
        } else if (direction === "down") {
            $(this.element).addClass("animate");
        }
    },{
        offset: '85%'
    });

    var $newsList = $('.content-news-list .grid').masonry({
        // options
        columnWidth: '.grid-sizer',
        itemSelector: '.grid-item',
        percentPosition: true
    });
    $newsList.imagesLoaded().progress(function () {
        $newsList.masonry('layout');
        Waypoint.refreshAll();
    });
},false);


// window.addEventListener("load",function(event) {
//     x = w.innerWidth || e.clientWidth || g.clientWidth;
//     y = w.innerHeight || e.clientHeight || g.clientHeight;
//
//     Waypoint.refreshAll();
// },false);

window.addEventListener('resize', function(){
    x = w.innerWidth || e.clientWidth || g.clientWidth;
    y = w.innerHeight || e.clientHeight || g.clientHeight;

    $('.slick-slider').slick('setPosition');

    Waypoint.refreshAll();
    //AOS.refresh();

}, false);
