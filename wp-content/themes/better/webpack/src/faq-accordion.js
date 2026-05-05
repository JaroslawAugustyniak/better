/**
 * FAQ Accordion Enhancement
 * Enhances Bootstrap Collapse accordion with custom functionality
 */

document.addEventListener('DOMContentLoaded', function() {
  const faqAccordion = document.getElementById('faqAccordion');

  if (!faqAccordion) {
    return;
  }

  // Get all accordion buttons
  const buttons = faqAccordion.querySelectorAll('.accordion-button');

  buttons.forEach(button => {
    button.addEventListener('click', function() {
      // Optional: Add custom tracking or behavior
      const targetId = this.getAttribute('data-bs-target');
      const isExpanded = !this.classList.contains('collapsed');

      // Log for debugging (optional)
      console.log('FAQ item toggled:', {
        id: targetId,
        isExpanded: isExpanded
      });

      // Optional: Add custom class for styling
      this.closest('.accordion-item').classList.toggle('active', isExpanded);
    });

    // Set initial state for active items
    if (!button.classList.contains('collapsed')) {
      button.closest('.accordion-item').classList.add('active');
    }
  });

  // Optional: Close all items on Escape key
  document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') {
      buttons.forEach(button => {
        if (!button.classList.contains('collapsed')) {
          const bsCollapse = new bootstrap.Collapse(
            button.closest('.accordion-item').querySelector('.accordion-collapse'),
            { toggle: false }
          );
          bsCollapse.hide();
        }
      });
    }
  });
});
