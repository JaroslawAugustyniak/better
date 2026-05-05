/**
 * Comments Carousel with Slick Slider
 * Niezależny system karuzeli dla komentarzy
 */

// Import jQuery (jeśli nie jest globalnie dostępne)
import $ from 'jquery';

// Import Slick Carousel
import 'slick-carousel';

// Import Slick CSS (jeśli nie jest już załadowany)
import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';

// Make jQuery available globally if needed
window.$ = window.jQuery = $;

/**
 * Comments Carousel Class
 */
class CommentsCarousel {
    constructor(options = {}) {
        // Konfiguracja
        this.config = {
            carouselId: 'commentsCarousel',
            autoplay: true,
            autoplaySpeed: 8000,
            keyboardNavigation: true,
            showCounter: true,
            showIndicators: true,
            expandComments: true,
            ...options
        };

        // Stan carousel
        this.currentSlide = 0;
        this.comments = [];
        
        // Elementy DOM
        this.carousel = null;
        this.$carousel = null;
        this.slides = [];
        
        // Elementy nawigacji
        this.prevBtn = null;
        this.nextBtn = null;
        this.indicators = null;
        this.counter = null;
        
        // Flagi
        this.isInitialized = false;
        this.slickInitialized = false;

        // Inicjalizacja z opóźnieniem
        setTimeout(() => {
            this.init();
        }, 300);
    }

    /**
     * Inicjalizacja carousel
     */
    async init() {
        try {
            // console.log('Starting Comments Carousel initialization...');
            
            this.getElements();
            // console.log('✓ Elements found');
            
            this.extractCommentData();
            // console.log('✓ Comment data extracted:', this.comments.length, 'comments');
            
            this.setupAccessibility();
            // console.log('✓ Accessibility setup');
            
            await this.initSlickCarousel();
            // console.log('✓ Slick initialized');
            
            this.bindEvents();
            // console.log('✓ Events bound');
            
            this.setupCustomNavigation();
            // console.log('✓ Custom navigation setup');
            
            if (this.config.expandComments) {
                this.setupCommentExpansion();
                // console.log('✓ Comment expansion setup');
            }
            
            this.isInitialized = true;
            // console.log('✅ Comments Carousel initialized successfully');

            window.dispatchEvent(new CustomEvent('sliderInitialized', {
                detail: { type: 'comments', instance: this }
            }));

        } catch (error) {
            // console.error('❌ Comments Carousel initialization failed:', error);
            throw error;
        }
    }

    /**
     * Pobieranie elementów DOM
     */
    getElements() {
        this.carousel = document.getElementById(this.config.carouselId);
        if (!this.carousel) {
            throw new Error(`Carousel element with ID "${this.config.carouselId}" not found`);
        }

        this.$carousel = $(this.carousel);
        this.slides = Array.from(this.carousel.querySelectorAll('.comment-slide'));

        // Elementy nawigacji
        this.prevBtn = document.getElementById('commentsPrev');
        this.nextBtn = document.getElementById('commentsNext');
        this.indicators = document.getElementById('commentsIndicators');
        this.counter = this.carousel.closest('.comments-carousel-container').querySelector('.carousel-counter');

        if (this.slides.length === 0) {
            throw new Error('No comment slides found in carousel');
        }
    }

    /**
     * Wyciąganie danych o komentarzach z DOM
     */
    extractCommentData() {
        this.comments = this.slides.map((slide, index) => ({
            id: slide.dataset.commentId || index,
            index: parseInt(slide.dataset.index) || index,
            author: slide.dataset.author || `User ${index + 1}`,
            element: slide
        }));

        if (this.comments.length === 0) {
            throw new Error('No comment data found');
        }

        console.log(`Found ${this.comments.length} comments for carousel`);
    }

    /**
     * Inicjalizacja Slick Carousel
     */
    async initSlickCarousel() {
        return new Promise((resolve, reject) => {
            try {
                console.log('Initializing Slick Carousel for comments...');
                
                // Sprawdź czy Slick jest dostępny
                if (!$.fn.slick) {
                    throw new Error('Slick Carousel not found. Make sure it\'s imported.');
                }

                // Konfiguracja Slick Carousel dla komentarzy
                const slickConfig = {
                    slidesToShow: 3,
                    slidesToScroll: 1,
                    infinite: true,
                    arrows: true, // Używamy custom nawigacji
                    dots: false,   // Używamy custom indicators
                    speed: 600,
                    autoplay: this.config.autoplay,
                    autoplaySpeed: this.config.autoplaySpeed,
                    cssEase: 'cubic-bezier(0.25, 0.46, 0.45, 0.94)',
                    adaptiveHeight: false,
                    variableWidth: false,
                    centerMode: false,
                    focusOnSelect: false,
                    accessibility: true,
                    draggable: true,
                    swipe: true,
                    touchMove: true,
                    useTransform: true,
                    pauseOnHover: true,
                    pauseOnDotsHover: false,
                    responsive: [
                        {
                            breakpoint: 1200,
                            settings: {
                                slidesToShow: 2
                            }
                        },
                        {
                            breakpoint: 992,
                            settings: {
                                slidesToShow: 2,
                                autoplaySpeed: 6000
                            }
                        },
                        {
                            breakpoint: 768,
                            settings: {
                                slidesToShow: 1,
                                autoplaySpeed: 5000
                            }
                        },
                        {
                            breakpoint: 576,
                            settings: {
                                slidesToShow: 1,
                                autoplaySpeed: 4000,
                                swipe: true,
                                touchMove: true
                            }
                        }
                    ]
                };

                console.log('Slick config for comments:', slickConfig);

                // Initialize Slick
                this.$carousel.slick(slickConfig);
                this.slickInitialized = true;

                console.log('✓ Slick Carousel initialized for comments');

                // Setup additional features
                this.onSlickInit();
                
                // Resolve immediately after initialization
                resolve();
                
            } catch (error) {
                console.error('❌ Failed to initialize Slick Carousel for comments:', error);
                reject(error);
            }
        });
    }

    /**
     * Callback po inicjalizacji Slick
     */
    onSlickInit() {
        console.log('Setting up post-Slick features for comments...');
        
        this.$carousel.addClass('slick-initialized-comments');

        // Bind Slick-specific events
        this.$carousel.on('afterChange', (event, slick, currentSlide) => {
            this.onSlideChange(currentSlide);
        });

        this.$carousel.on('beforeChange', (event, slick, currentSlide, nextSlide) => {
            this.onBeforeSlideChange(currentSlide, nextSlide);
        });

        console.log('✓ Post-Slick setup complete for comments');
    }

    /**
     * Bindowanie event handlerów
     */
    bindEvents() {
        console.log('Binding events for comments carousel...');
        
        // Custom navigation buttons
        if (this.prevBtn) {
            $(this.prevBtn).on('click', (e) => {
                e.preventDefault();
                this.prevSlide();
            });
        }

        if (this.nextBtn) {
            $(this.nextBtn).on('click', (e) => {
                e.preventDefault();
                this.nextSlide();
            });
        }

        // Indicator dots
        if (this.indicators) {
            $(this.indicators).on('click', '.indicator-dot', (e) => {
                e.preventDefault();
                const index = parseInt(e.currentTarget.dataset.index);
                this.goToSlide(index);
            });
        }

        // Keyboard navigation
        if (this.config.keyboardNavigation) {
            $(document).on('keydown.commentsCarousel', (e) => this.handleKeyboard(e));
        }

        // Pause autoplay on hover
        this.$carousel.on('mouseenter', () => {
            if (this.slickInitialized) {
                this.$carousel.slick('slickPause');
            }
        });

        this.$carousel.on('mouseleave', () => {
            if (this.slickInitialized && this.config.autoplay) {
                this.$carousel.slick('slickPlay');
            }
        });

        console.log('✅ All events bound successfully for comments');
    }

    /**
     * Setup custom nawigacji
     */
    setupCustomNavigation() {
        if (this.config.showIndicators && this.indicators) {
            this.updateIndicators();
        }
        
        if (this.config.showCounter && this.counter) {
            this.updateCounter();
        }
        
        this.updateNavigationButtons();
    }

    /**
     * Setup rozwijania komentarzy
     */
    setupCommentExpansion() {
        $(this.carousel).on('click', '.comment-toggle', (e) => {
            e.preventDefault();
            this.toggleCommentExpansion(e.currentTarget);
        });
    }

    /**
     * Rozwijanie/zwijanie komentarza
     */
    toggleCommentExpansion(button) {
        const $button = $(button);
        const $card = $button.closest('.comment-card');
        const $preview = $card.find('.comment-preview');
        const $full = $card.find('.comment-full');
        const $expandText = $button.find('.expand-text');
        const $collapseText = $button.find('.collapse-text');
        
        if ($button.data('action') === 'expand') {
            // Rozwiń
            $preview.hide();
            $full.show();
            $expandText.hide();
            $collapseText.show();
            $button.data('action', 'collapse');
            
            // Tracking
            this.trackCommentExpansion($card.closest('.comment-slide').data('comment-id'));
        } else {
            // Zwiń
            $preview.show();
            $full.hide();
            $expandText.show();
            $collapseText.hide();
            $button.data('action', 'expand');
        }
    }

    /**
     * Callback dla zmiany slajdu
     */
    onSlideChange(currentSlide) {
        console.log('Comments slide changed to:', currentSlide);
        this.currentSlide = currentSlide;
        
        if (this.config.showIndicators) {
            this.updateIndicators();
        }
        
        if (this.config.showCounter) {
            this.updateCounter();
        }
        
        this.updateNavigationButtons();
        this.trackSlideChange(currentSlide);
    }

    /**
     * Callback przed zmianą slajdu
     */
    onBeforeSlideChange(currentSlide, nextSlide) {
        console.log('Comments slide changing from', currentSlide, 'to', nextSlide);
    }

    /**
     * Obsługa klawiatury
     */
    handleKeyboard(e) {
        if (this.isCarouselFocused()) {
            switch (e.key) {
                case 'ArrowLeft':
                    e.preventDefault();
                    this.prevSlide();
                    break;
                case 'ArrowRight':
                    e.preventDefault();
                    this.nextSlide();
                    break;
                case 'Home':
                    e.preventDefault();
                    this.goToSlide(0);
                    break;
                case 'End':
                    e.preventDefault();
                    this.goToSlide(this.comments.length - 1);
                    break;
            }
        }
    }

    /**
     * Sprawdza czy karuzela jest w fokusie
     */
    isCarouselFocused() {
        return document.activeElement === this.carousel || 
               this.carousel.contains(document.activeElement);
    }

    /**
     * Setup accessibility
     */
    setupAccessibility() {
        if (this.carousel) {
            this.carousel.setAttribute('role', 'region');
            this.carousel.setAttribute('aria-label', 'Karuzela z opiniami klientów');
        }

        this.slides.forEach((slide, index) => {
            slide.setAttribute('role', 'group');
            slide.setAttribute('aria-label', `Opinia ${index + 1} z ${this.slides.length}`);
        });

        if (this.prevBtn) {
            this.prevBtn.setAttribute('aria-label', 'Poprzednia opinia');
        }
        
        if (this.nextBtn) {
            this.nextBtn.setAttribute('aria-label', 'Następna opinia');
        }
    }

    // Slick API methods
    prevSlide() {
        if (this.slickInitialized) {
            this.$carousel.slick('slickPrev');
        }
    }

    nextSlide() {
        if (this.slickInitialized) {
            this.$carousel.slick('slickNext');
        }
    }

    goToSlide(slideIndex) {
        if (this.slickInitialized && slideIndex >= 0 && slideIndex < this.comments.length) {
            this.$carousel.slick('slickGoTo', slideIndex);
        }
    }

    getCurrentSlide() {
        if (this.slickInitialized) {
            return this.$carousel.slick('slickCurrentSlide');
        }
        return 0;
    }

    /**
     * Aktualizacja wskaźników
     */
    updateIndicators() {
        if (!this.indicators) return;

        const dots = this.indicators.querySelectorAll('.indicator-dot');
        dots.forEach((dot, index) => {
            $(dot).toggleClass('active', index === this.currentSlide);
        });
    }

    /**
     * Aktualizacja licznika
     */
    updateCounter() {
        if (!this.counter) return;

        const currentSpan = this.counter.querySelector('.current-slide');
        const totalSpan = this.counter.querySelector('.total-slides');
        
        if (currentSpan) {
            currentSpan.textContent = this.currentSlide + 1;
        }
        
        if (totalSpan) {
            totalSpan.textContent = this.comments.length;
        }
    }

    /**
     * Aktualizacja przycisków nawigacji
     */
    updateNavigationButtons() {
        // W przypadku infinite: true, przyciski są zawsze aktywne
        if (this.prevBtn) {
            $(this.prevBtn).prop('disabled', false);
        }
        
        if (this.nextBtn) {
            $(this.nextBtn).prop('disabled', false);
        }
    }

    // Analytics and tracking
    trackSlideChange(slideIndex) {
        const comment = this.comments[slideIndex];
        
        if (typeof gtag !== 'undefined') {
            gtag('event', 'comments_carousel_slide_change', {
                slide_index: slideIndex,
                comment_id: comment.id,
                comment_author: comment.author,
                total_slides: this.comments.length
            });
        }
        
        if (typeof fbq !== 'undefined') {
            fbq('trackCustom', 'CommentsCarouselView', {
                content_category: 'Comments_Carousel',
                content_type: 'comment_view',
                slide_index: slideIndex,
                timestamp: new Date().toISOString()
            });
        }
    }

    trackCommentExpansion(commentId) {
        if (typeof gtag !== 'undefined') {
            gtag('event', 'comment_expanded', {
                comment_id: commentId,
                event_category: 'Comments',
                event_label: 'Comment Expansion'
            });
        }
    }

    // Public API
    getTotalSlides() {
        return this.comments.length;
    }

    refresh() {
        if (this.slickInitialized) {
            this.$carousel.slick('refresh');
        }
    }

    pause() {
        if (this.slickInitialized) {
            this.$carousel.slick('slickPause');
        }
    }

    play() {
        if (this.slickInitialized && this.config.autoplay) {
            this.$carousel.slick('slickPlay');
        }
    }

    destroy() {
        if (this.slickInitialized) {
            this.$carousel.slick('unslick');
            this.slickInitialized = false;
        }

        $(document).off('keydown.commentsCarousel');
        
        this.isInitialized = false;
        console.log('Comments Carousel destroyed');
    }
}

/**
 * Auto-initialize when DOM is ready
 */
$(document).ready(function() {
    console.log('🚀 Comments Carousel module loaded');
    console.log('📊 jQuery version:', $.fn.jquery);
    console.log('🎠 Slick available:', typeof $.fn.slick);
    
    const carouselElement = document.getElementById('commentsCarousel');
    
    if (carouselElement) {
        console.log('🎯 Comments carousel element found:', carouselElement);
        
        const slides = carouselElement.querySelectorAll('.comment-slide');
        console.log('📝 Comment slides found:', slides.length);
        
        if (slides.length > 0) {
            try {
                window.commentsCarousel = new CommentsCarousel({
                    carouselId: 'commentsCarousel',
                    autoplay: true,
                    autoplaySpeed: 8000,
                    keyboardNavigation: true,
                    showCounter: true,
                    showIndicators: true,
                    expandComments: true
                });
                
                console.log('🎉 Comments Carousel initialized successfully');
                console.log('📋 Instance available at: window.commentsCarousel');
            } catch (error) {
                console.error('💥 Failed to initialize Comments Carousel:', error);
                console.log('🔧 Debug info:');
                console.log('- Carousel element:', carouselElement);
                console.log('- Slides found:', slides.length);
            }
        } else {
            console.log('ℹ️ No comment slides found in carousel');
        }
    } else {
        console.log('ℹ️ Comments Carousel element not found on this page');
        console.log('🔍 Looking for element with ID: commentsCarousel');
    }
});

/**
 * Handle page resize with debounce
 */
let resizeTimer;
$(window).on('resize', function() {
    clearTimeout(resizeTimer);
    resizeTimer = setTimeout(function() {
        if (window.commentsCarousel && window.commentsCarousel.isInitialized) {
            window.commentsCarousel.refresh();
        }
    }, 150);
});

// Make class available globally
window.CommentsCarousel = CommentsCarousel;

// Export for module systems
export default CommentsCarousel;