console.log('main.js loaded');

import $ from 'jquery';

// Import Slick Carousel
import 'slick-carousel';

// Import Slick CSS
import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';

// main.js
import YouTubeSlider from './youtube-slider.js';
import SliderCarousel from './slider-carousel.js';
import Comments from './comments.js';
import FaqAccordeon from './faq-accordion.js';
import SeoAccordeon from './seo-accordion.js';
// import NewsCarousel from './news-carousel.js';
import InitializationManager from './init-manager.js';
import App from './main-app.js';

import 'jquery.cookie';

// console.log('All imports loaded, Comments is:', Comments);

// Utwórz InitManager globalnie NA POCZĄTKU
window.initManager = new InitializationManager();

// Import Select2
import 'select2';
import 'select2/dist/css/select2.min.css';
// console.log = function() {};

jQuery(document).ready(function($){
  cookiesPolicyBar();

  initSliders($('body'));

  initContact();

  // Initialize Comments Module
  new Comments();
});

function initContact(){
  $('#kontakt .menu-button').on('click', function(){
    $('#kontakt').removeClass('active');
  });
}

function cookiesPolicyBar(){
  // Check cookie 
  

  if ($.cookie('cooki-policy-better') != "active") {
    $('#cookieAcceptBar').show(); 
  }
  //Assign cookie on click
  $('#cookieAcceptBarConfirm').on('click',function(){
      $.cookie('cooki-policy-better', 'active', { expires: 1 }); // cookie will expire in one day
      $('#cookieAcceptBar').fadeOut();
  });
}




function trackEvents() {
      // Sprawdź czy funkcja już była uruchomiona
  if (window.trackEventsInitialized) {
    console.warn('trackEvents już zainicjalizowana');
    return window.existingTracker;
  }

  const buttons = [
    {
      id: 'wideo_konsultacja',
      eventName: 'video_consultation_click',
      metaEvent: 'Lead'
    },
    {
      id: 'umow_wizyte_promo',
      eventName: 'promo_applied',
      metaEvent: 'Lead'
    },
    {
      id: 'umow_wizyte',
      eventName: 'booking_click',
      metaEvent: 'Lead'
    },
    {
      id: 'footer_phone',
      eventName: 'phone_click_footer',
      metaEvent: 'Lead'
    },
    {
      id: 'footer_email',
      eventName: 'email_click_footer',
      metaEvent: 'Lead'
    },
    {
      id: 'contact_form_button',
      eventName: 'lead_submit',
      metaEvent: 'Lead'
    },
    {
      id: 'header_phone',
      eventName: 'phone_click',
      metaEvent: 'Lead'
    },
    {
      id: 'header_email',
      eventName: 'email_click',
      metaEvent: 'Lead'
    }
  ];

  // Funkcja do wysyłania eventów
  function sendEvent(eventData) {

    const standardEvents = [
    'ViewContent', 'Search', 'AddToCart', 'AddToWishlist', 
    'InitiateCheckout', 'AddPaymentInfo', 'Purchase', 'Lead',  // ← Lead JEST na liście
    'CompleteRegistration', 'Contact', 'CustomizeProduct', 
    'Donate', 'FindLocation', 'StartTrial', 'SubmitApplication', 'Subscribe'
  ];

    // Debug log
    console.log('Event triggered:', {
      event: eventData.metaEvent,
      ga4Event: eventData.eventName,
      data: {
        content_category: 'CTA',
        content_name: eventData.eventName,
        element_id: eventData.id
      }
    });

    // Wysyłanie do GA4
    if (typeof gtag !== 'undefined') {
      gtag('event', eventData.eventName, {
        event_category: 'CTA',
        event_label: '#' + eventData.id
      });
    }else{
        console.log('gtag is not defined, skipping GA4 event tracking');
    }
    
    // Wysyłanie do Meta Pixel
    if (typeof fbq !== 'undefined') {
        console.log('Checking event:', eventData.metaEvent, 'Is standard:', standardEvents.includes(eventData.metaEvent));
    
        if (standardEvents.includes(eventData.metaEvent)) {
            // ✅ Standardowy event - użyj track
            fbq('track', eventData.metaEvent, {
                content_category: 'CTA',
                content_name: eventData.eventName,
                element_id: eventData.id
            });
            console.log('Sent as standard event:', eventData.metaEvent);
        } else {
            // ✅ Niestandardowy event - użyj trackCustom
            fbq('trackCustom', eventData.metaEvent, {
                content_category: 'CTA',
                content_name: eventData.eventName,
                element_id: eventData.id
            });
            console.log('Sent as custom event:', eventData.metaEvent);
        }

    }else{
        console.log('fbq is not defined, skipping Meta Pixel event tracking');
    }
    
    
  }

  // Automatyczne trackowanie po załadowaniu DOM
  document.addEventListener('DOMContentLoaded', function () {
    buttons.forEach(function (btn) {
      const element = document.getElementById(btn.id);
      if (element) {
        element.addEventListener('click', function () {
          sendEvent(btn);
        });
      }
    });
  });

  // Funkcja do ręcznego wywołania po ID elementu
  function trackById(elementId) {
    const btn = buttons.find(b => b.id === elementId);
    if (btn) {
      sendEvent(btn);
    } else {
      console.warn('Event configuration not found for ID:', elementId);
    }
  }

  // Funkcja do ręcznego wywołania z custom danymi
  function trackCustom(eventData) {
    sendEvent(eventData);
  }

  // Zwracamy funkcje publiczne
  return {
    trackById: trackById,
    trackCustom: trackCustom,
    buttons: buttons // Na wypadek gdybyś chciał sprawdzić dostępne eventy
  };
}



function initSliders(parent){
    $(parent).find('.slickSlider').each(function(){
      var ID = $(this).attr('id');
      var resp = $(this).attr('slick_per_page').split('_');
      var showDots = $(this).attr('slick_show_dots') && $(this).attr('slick_show_dots')=='1' ? true : false;
      var hideArrows = $(this).attr('slick_hide_arrows') && $(this).attr('slick_hide_arrows')=='1' ? false : true;
      var varWidth = $(this).attr('variable_width') && $(this).attr('variable_width')=='1' ? true : false;
      var center_mode = $(this).attr('center_mode') && $(this).attr('center_mode')=='0' ? false : true;
      var infinite = $(this).attr('infinite') && $(this).attr('infinite')=='0' ? false : true;
      var speed = $(this).attr('speed') ? $(this).attr('speed') : 5000;
      var autoplay = $(this).attr('auto_play') && $(this).attr('auto_play') == '1' ? true : false;
      var pause = $(this).attr('pause_on_hover') && $(this).attr('pause_on_hover') == '1' ? true : false;
      var fade = $(this).attr('fade') && $(this).attr('fade')=='1' ? true : false;

      

      var resp_1 = circumference(resp[0] ? resp[0] : 4); 
      var resp_2 = circumference(resp[1] ? resp[1] : 3);
      var resp_3 = circumference(resp[2] ? resp[2] : 1);
      var resp_4 = circumference(resp[3] ? resp[3] : 1);

  
      var customArrows = $(this).attr('navigation') ? true : false;
      var prevArr = customArrows ? $('#'+$(this).attr('navigation')+' .slick-prev') : '<button class="slick-prev slick-arrow" aria-label="Previous" type="button" aria-disabled="true" style="">Previous</button>';
      var nextArr = customArrows ? $('#'+$(this).attr('navigation')+' .slick-next') : '<button class="slick-next slick-arrow" aria-label="Next" type="button" style="" aria-disabled="true">Next</button>';
      
      console.log('#'+ID+'  autoplay: '+autoplay);

      $('#'+ID).slick({
        dots: showDots,
        arrows: hideArrows,
        infinite: infinite,
        speed: 500,
        fade: fade,
        autoplay: autoplay,
        autoplaySpeed: speed,
        variableWidth: varWidth,
        centerMode: false, 
        cssEase: 'linear',
        slidesToShow: resp_1,
        slidesToScroll: resp_1,
        swipeToSlide: true,
        prevArrow: prevArr,
        nextArrow: nextArr,
        pauseOnHover:pause,
  
        responsive: [
          {
            breakpoint: 1200,
            settings: {
              dots: showDots,
              slidesToShow: resp_2,
              slidesToScroll: resp_2,
              infinite: infinite
            }
          },
          {
            breakpoint: 920,
            settings: {
              slidesToShow: resp_3,
              slidesToScroll: resp_3,
              variableWidth: false
            }
          },
          {
            breakpoint: 650,
            settings: {
              slidesToShow: resp_4,
              slidesToScroll: resp_4,
              // centerMode: center_mode, 
              variableWidth: true
            }
          }
  
        ]
      }); 
    
    $('#'+ID).on('afterChange', slickInit);
    $('#'+ID).trigger('afterChange');

    $('#'+ ID).find('.slider-menu li').each(function(){
        $(this).on('click', function(){
          
            $('#'+ ID).slick('slickGoTo', $(this).attr('slider-index'));
            return false;
        });
    });

    $('#'+ ID).find('.slickGoTo').each(function(){
      $(this).on('click', function(){
        $('#'+ ID).slick('slickGoTo', $(this).attr('slick_index'));
      });
    });
    
  });
  }

  function circumference(r) {
    if (Number.isNaN(Number.parseFloat(r))) {
      return 0;
    }
    return parseFloat(r) ;
  }

  function slickInit(slick, currentTarget){
    var moveDots = $(slick.target).hasClass('moveDots') ? true : false;
    if(moveDots){
      var moveDotsTo = $($(slick.target).attr('move-dots-to'));
      var moveDotsFrom = $($(slick.target).find('.slick-dots'));
      moveDotsFrom.addClass('slick-dots-outside');
      moveDotsTo.append(moveDotsFrom);
    }

  }

