
// main.js
import YouTubeSlider from './youtube-slider.js';
import SliderCarousel from './slider-carousel.js';
import CommentsCarousel from './comments-carousel.js';
import NewsCarousel from './news-carousel.js';
import InitializationManager from './init-manager.js';
import App from './main-app.js';

import 'jquery.cookie';

// Utwórz InitManager globalnie NA POCZĄTKU
window.initManager = new InitializationManager();

// Import Select2
import 'select2';
import 'select2/dist/css/select2.min.css';
// console.log = function() {};

jQuery(document).ready(function($){
  cookiesPolicyBar();
});

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




