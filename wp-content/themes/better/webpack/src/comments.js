// Comments Module
export default class Comments {
  constructor() {
    // jQuery jest dostępna globalnie dzięki ProvidePlugin w webpack.config
    this.$ = window.jQuery || window.$;

    if (!this.$) {
      console.error('jQuery not available!');
      return;
    }

    this.init();
    // console.log('Comments module initialized');
  }

  init() {
    // console.log('Init called');

    // Comments Carousel
    const carouselEl = this.$('#commentsCarousel');
    // console.log('Carousel element found:', carouselEl.length);

    if (carouselEl.length > 0) {
      try {
        // console.log('Initializing Slick carousel...');
        carouselEl.slick({
          infinite: true,
          slidesToShow: 1,
          slidesToScroll: 1,
          arrows: false,
          dots: false,
          autoplay: true,
          autoplaySpeed: 5000,
          pauseOnHover: true
        });
        // console.log('Slick carousel initialized successfully');
      } catch (error) {
        // console.error('Error initializing Slick:', error);
      }
    }

    // console.log('About to bind comment toggle');
    this.bindCommentToggle();
    this.bindModalEvents();
    // console.log('Init completed');
  }

  bindCommentToggle() {
    // console.log('Binding comment toggle');
    const toggleCount = this.$('.comment-toggle').length;
    // console.log('Found ' + toggleCount + ' comment-toggle buttons');

    this.$(document).on('click', '.comment-toggle', (e) => {
    //   console.log('Comment toggle clicked');
      e.preventDefault();
      const commentId = this.$(e.target).closest('.comment-toggle').data('comment-id');
    //   console.log('Comment ID:', commentId);
      this.openCommentModal(commentId);
    });
  }

  openCommentModal(commentId) {
    // alert('Opening comment modal for comment ID: ' + commentId); // Debugging alert
    const $slide = this.$(`.comment-slide[data-comment-id="${commentId}"]`);
    const $card = $slide.find('.comment-card');
    const author = $slide.data('author');

    // Get rates
    const rateText = $card.find('.rateholder').clone();

    // Get full text
    const $fullText = $card.find('.comment-full');
    const fullContent = $fullText.html() || $card.find('.comment-text').html();

    // Populate modal
    // const starsHtml = '<i class="fa fa-star"></i>'.repeat(5);
    // this.$('#commentModal .comment-modal-stars').html(starsHtml);
    this.$('#commentModal .comment-modal-rate').empty().append(rateText);
    this.$('#commentModal .comment-modal-text').html(fullContent);
    this.$('#commentModal .comment-modal-author').text(author);

    // Show modal
    this.$('#commentModal').addClass('active');
  }

  closeCommentModal() {
    this.$('#commentModal').removeClass('active');
  }

  bindModalEvents() {
    // Modal overlay click to close
    this.$(document).on('click', '.comment-modal-overlay', () => {
      this.closeCommentModal();
    });

    // Modal close button click
    this.$(document).on('click', '.comment-modal-close', () => {
      this.closeCommentModal();
    });

    // Close modal on ESC key
    this.$(document).on('keydown', (e) => {
      if (e.key === 'Escape' && this.$('#commentModal').hasClass('active')) {
        this.closeCommentModal();
      }
    });
  }
}
