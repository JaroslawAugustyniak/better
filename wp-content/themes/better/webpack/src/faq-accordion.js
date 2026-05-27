/**
 * FAQ Accordion Enhancement
 * Enhances Bootstrap Collapse accordion with custom functionality
 */
import $ from 'jquery';
// Make jQuery available globally if needed
window.$ = window.jQuery = $;

$(document).ready(function() {
    // Initialize FAQ Accordion
    initFaqAccordion();
});
var isOpen;
function initFaqAccordion() {
  
    const $accordion = $('.wp-block-rank-math-faq-block');

  

    if ($accordion.length === 0) {
        console.warn('FAQ Accordion element not found!');
        return;
    }

    $accordion.find('.rank-math-faq-item').each(function() {
      
      const $item = $(this);
      const $header = $item.find('.rank-math-question');
      const $body = $item.find('.rank-math-answer');

      $header.on('click', function() {
        isOpen = $item.hasClass('show');
        if (isOpen) {
          $item.removeClass('show');
          $body.slideUp(300);
        } else {

          $accordion.find('.rank-math-faq-item').each(function() {
            const $otherItem = $(this);
            if ($otherItem.hasClass('show')) {
              $otherItem.removeClass('show');
              $otherItem.find('.rank-math-answer').slideUp(300);
            }
          });

          $item.addClass('show');
          $body.slideDown(300);
        }
      });
    });
  }
