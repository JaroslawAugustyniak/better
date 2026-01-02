/**
 * Main Application Logic
 */

import $ from 'jquery';
import imagesLoaded from 'imagesloaded';

// Bootstrap
require('bootstrap');

// Easy Responsive Tabs
require('easy-responsive-tabs');

// Lightgallery
require('lightgallery');


// Masonry
var jQueryBridget = require('jquery-bridget');
var Masonry = require('masonry-layout');
jQueryBridget('masonry', Masonry, $);
require('imagesloaded');

// Waypoints
require('../node_modules/waypoints/lib/jquery.waypoints.js');

// Zmienne globalne
var w = window,
    d = document,
    e = d.documentElement,
    g = d.getElementsByTagName('body')[0];
var x, y;

/**
 * Inicjalizacja po załadowaniu strony
 */
$(document).ready(function() {
    
        // Odczekaj jeszcze chwilę na obrazki w sliderach
     
    $('.page-header .menu-button, .menu-module .menu-button').on('click', function() {
        if ($('.menu-module').hasClass('menu-module--open')) {
            $('.menu-module').animate({opacity: 0}, 500, function () {
                $(this).removeClass('menu-module--open');
            });
            $('.page-header .menu-button').removeClass('open');
            $('.menu-module .menu-button').removeClass('open');
        } else {
            $('.menu-module').addClass('menu-module--open').css('opacity', 0).animate({opacity: 1}, 500);
            $('.page-header .menu-button').addClass('open');
            $('.menu-module .menu-button').addClass('open');
        }
    });



});

// Odśwież przy ładowaniu obrazków
    imagesLoaded(document).on('always', function() {
            if (window.initManager) {                
                window.initManager.init();
            } else {
                console.error('InitManager not found!');
            }
    });

/**
 * Główna logika strony
 */
window.addEventListener("load", function(event) {

    x = w.innerWidth || e.clientWidth || g.clientWidth;
    y = w.innerHeight || e.clientHeight || g.clientHeight;

    // Scroll do hash
    var hash = window.location.hash;
    if (hash != '' && $(hash).length > 0) {
        var sectionHeight = $(hash).innerHeight();
        var topOfset = 0;

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

    // Return to top button
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

    // Fluid link
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
            var topOfset = 0;
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

});

// Require dodatkowych modułów
