/**
 * FAQ Accordion Enhancement
 * Enhances Bootstrap Collapse accordion with custom functionality
 */
import $ from 'jquery';
// Make jQuery available globally if needed
window.$ = window.jQuery = $;

$(document).ready(function() {
    // Initialize FAQ Accordion
    initSeoAccordion();
});
var isOpen;
function initSeoAccordion() {
  
    const $accordion = $('.children');

  

    if ($accordion.length === 0) {
        console.warn('FAQ Accordion element not found!');
        return;
    }

    $accordion.find('.tabs_block_children_item').each(function() {
      
      const $item = $(this);
      const $header = $item.find('> .title');
      const $body = $item.find('> .description');

      $header.on('click', function() {
        isOpen = $item.hasClass('active');
        if (isOpen) {
          $item.removeClass('active');
          $body.slideUp(300);
        } else {

          $accordion.find('.tabs_block_children_item').each(function() {
            const $otherItem = $(this);
            if ($otherItem.hasClass('active')) {
              $otherItem.removeClass('active');
              $otherItem.find('.description').slideUp(300);
            }
          });

          $item.addClass('active');
          $body.slideDown(300);
        }
      });
    });

    $accordion.find('.tabs_block_children_2_item').each(function() {
      
      const $item = $(this);
      const $header = $item.find('> .title');
      const $body = $item.find('> .description');

      $header.on('click', function() {
        isOpen = $item.hasClass('active');
        if (isOpen) {
          $item.removeClass('active');
          $body.slideUp(300);
        } else {

          $accordion.find('.tabs_block_children_2_item').each(function() {
            const $otherItem = $(this);
            if ($otherItem.hasClass('active')) {
              $otherItem.removeClass('active');
              $otherItem.find('.description').slideUp(300);
            }
          });

          $item.addClass('active');
          $body.slideDown(300);
        }
      });
    });

    // Initialize SEO Container Toggle
    const $toggleBtn = $('.toggle_button');
    const $seoContainer = $('.seo-container .tabs_block');
    let isExpanded = false;

    if ($toggleBtn.length > 0 && $seoContainer.length > 0) {
      $toggleBtn.on('click', function(e) {
        e.preventDefault();

        if (isExpanded) {
          // Collapse
          $seoContainer.removeClass('opened');
          $toggleBtn.removeClass('opened');
          isExpanded = false;
        } else {
          // Expand
          $seoContainer.addClass('opened');
          $toggleBtn.addClass('opened');
          isExpanded = true;
        }
      });
    }
  }
