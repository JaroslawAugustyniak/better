/**
 * Featured News Carousel with Slick Slider
 * System karuzeli dla promowanych aktualności
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
 * News Carousel Class
 */
class NewsCarousel {
    constructor(options = {}) {
        // Konfiguracja
        this.config = {
            carouselId: 'newsCarousel',
            autoplay: true,
            autoplaySpeed: 6000,
            keyboardNavigation: true,
            showCounter: true,
            showIndicators: true,
            ...options
        };

        // Stan carousel
        this.currentSlide = 0;
        this.news = [];
        
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
            console.log('Starting News Carousel initialization...');
            
            this.getElements();
            console.log('✓ Elements found');
            
            this.extractNewsData();
            console.log('✓ News data extracted:', this.news.length, 'items');
            
            this.setupAccessibility();
            console.log('✓ Accessibility setup');
            
            await this.initSlickCarousel();
            console.log('✓ Slick initialized');
            
            this.bindEvents();
            console.log('✓ Events bound');
            
            this.setupCustomNavigation();
            console.log('✓ Custom navigation setup');
            
            this.isInitialized = true;
            console.log('✅ News Carousel initialized successfully');

            window.dispatchEvent(new CustomEvent('sliderInitialized', {
                detail: { type: 'news', instance: this }
            }));

        } catch (error) {
            console.error('❌ News Carousel initialization failed:', error);
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
        this.slides = Array.from(this.carousel.querySelectorAll('.news-slide'));

        // Elementy nawigacji
        this.prevBtn = document.getElementById('newsPrev');
        this.nextBtn = document.getElementById('newsNext');
        this.indicators = document.getElementById('newsIndicators');
        this.counter = this.carousel.closest('.news-carousel-container')?.querySelector('.carousel-counter');

        if (this.slides.length === 0) {
            throw new Error('No news slides found in carousel');
        }
    }

    /**
     * Wyciąganie danych o aktualnościach z DOM
     */
    extractNewsData() {
        this.news = this.slides.map((slide, index) => ({
            id: slide.dataset.newsId || index,
            index: parseInt(slide.dataset.index) || index,
            title: slide.dataset.title || `News ${index + 1}`,
            url: slide.dataset.url || '#',
            element: slide
        }));

        if (this.news.length === 0) {
            throw new Error('No news data found');
        }

        console.log(`Found ${this.news.length} news items for carousel`);
    }

    /**
     * Inicjalizacja Slick Carousel
     */
    async initSlickCarousel() {
        return new Promise((resolve, reject) => {
            try {
                console.log('Initializing Slick Carousel for news...');
                
                // Sprawdź czy Slick jest dostępny
                if (!$.fn.slick) {
                    throw new Error('Slick Carousel not found. Make sure it\'s imported.');
                }

                // Konfiguracja Slick Carousel dla aktualności
                const slickConfig = {
                    slidesToShow: 3,
                    slidesToScroll: 1,
                    infinite: true,
                    arrows: true,
                    dots: false,
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
                                autoplaySpeed: 5000
                            }
                        },
                        {
                            breakpoint: 768,
                            settings: {
                                slidesToShow: 1,
                                autoplaySpeed: 4500
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

                console.log('Slick config for news:', slickConfig);

                // Initialize Slick
                this.$carousel.slick(slickConfig);
                this.slickInitialized = true;

                console.log('✓ Slick Carousel initialized for news');

                // Setup additional features
                this.onSlickInit();
                
                // Resolve immediately after initialization
                resolve();
                
            } catch (error) {
                console.error('❌ Failed to initialize Slick Carousel for news:', error);
                reject(error);
            }
        });
    }

    /**
     * Callback po inicjalizacji Slick
     */
    onSlickInit() {
        console.log('Setting up post-Slick features for news...');
        
        this.$carousel.addClass('slick-initialized-news');

        // Bind Slick-specific events
        this.$carousel.on('afterChange', (event, slick, currentSlide) => {
            this.onSlideChange(currentSlide);
        });

        this.$carousel.on('beforeChange', (event, slick, currentSlide, nextSlide) => {
            this.onBeforeSlideChange(currentSlide, nextSlide);
        });

        console.log('✓ Post-Slick setup complete for news');
    }

    /**
     * Bindowanie event handlerów
     */
    bindEvents() {
        console.log('Binding events for news carousel...');
        
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
            $(document).on('keydown.newsCarousel', (e) => this.handleKeyboard(e));
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

        // Click tracking na kartach aktualności
        $(this.carousel).on('click', '.news-card', (e) => {
            const $card = $(e.currentTarget);
            const newsId = $card.closest('.news-slide').data('news-id');
            const newsTitle = $card.closest('.news-slide').data('title');
            this.trackNewsClick(newsId, newsTitle);
        });

        console.log('✅ All events bound successfully for news');
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
     * Callback dla zmiany slajdu
     */
    onSlideChange(currentSlide) {
        console.log('News slide changed to:', currentSlide);
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
        console.log('News slide changing from', currentSlide, 'to', nextSlide);
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
                    this.goToSlide(this.news.length - 1);
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
            this.carousel.setAttribute('aria-label', 'Karuzela z promowanymi aktualnościami');
        }

        this.slides.forEach((slide, index) => {
            slide.setAttribute('role', 'group');
            slide.setAttribute('aria-label', `Aktualność ${index + 1} z ${this.slides.length}`);
        });

        if (this.prevBtn) {
            this.prevBtn.setAttribute('aria-label', 'Poprzednia aktualność');
        }
        
        if (this.nextBtn) {
            this.nextBtn.setAttribute('aria-label', 'Następna aktualność');
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
        if (this.slickInitialized && slideIndex >= 0 && slideIndex < this.news.length) {
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
            totalSpan.textContent = this.news.length;
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
        const newsItem = this.news[slideIndex];
        
        if (typeof gtag !== 'undefined') {
            gtag('event', 'news_carousel_slide_change', {
                slide_index: slideIndex,
                news_id: newsItem.id,
                news_title: newsItem.title,
                total_slides: this.news.length
            });
        }
        
        if (typeof fbq !== 'undefined') {
            fbq('trackCustom', 'NewsCarouselView', {
                content_category: 'News_Carousel',
                content_type: 'news_view',
                slide_index: slideIndex,
                timestamp: new Date().toISOString()
            });
        }
    }

    trackNewsClick(newsId, newsTitle) {
        if (typeof gtag !== 'undefined') {
            gtag('event', 'news_click', {
                news_id: newsId,
                news_title: newsTitle,
                event_category: 'News',
                event_label: 'News Card Click'
            });
        }
        
        if (typeof fbq !== 'undefined') {
            fbq('trackCustom', 'NewsClick', {
                content_type: 'news',
                content_ids: [newsId],
                content_name: newsTitle
            });
        }
    }

    // Public API
    getTotalSlides() {
        return this.news.length;
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

        $(document).off('keydown.newsCarousel');
        
        this.isInitialized = false;
        console.log('News Carousel destroyed');
    }
}

/**
 * Auto-initialize when DOM is ready
 */
$(document).ready(function() {
    console.log('🚀 News Carousel module loaded');
    console.log('📊 jQuery version:', $.fn.jquery);
    console.log('🎠 Slick available:', typeof $.fn.slick);
    
    const carouselElement = document.getElementById('newsCarousel');
    
    if (carouselElement) {
        console.log('🎯 News carousel element found:', carouselElement);
        
        const slides = carouselElement.querySelectorAll('.news-slide');
        console.log('🔍 News slides found:', slides.length);
        
        if (slides.length > 0) {
            try {
                window.newsCarousel = new NewsCarousel({
                    carouselId: 'newsCarousel',
                    autoplay: true,
                    autoplaySpeed: 6000,
                    keyboardNavigation: true,
                    showCounter: true,
                    showIndicators: true
                });
                
                console.log('🎉 News Carousel initialized successfully');
                console.log('📋 Instance available at: window.newsCarousel');
            } catch (error) {
                console.error('💥 Failed to initialize News Carousel:', error);
                console.log('🔧 Debug info:');
                console.log('- Carousel element:', carouselElement);
                console.log('- Slides found:', slides.length);
            }
        } else {
            console.log('ℹ️ No news slides found in carousel');
        }
    } else {
        console.log('ℹ️ News Carousel element not found on this page');
        console.log('🔍 Looking for element with ID: newsCarousel');
    }
});

/**
 * Handle page resize with debounce
 */
let resizeTimer;
$(window).on('resize', function() {
    clearTimeout(resizeTimer);
    resizeTimer = setTimeout(function() {
        if (window.newsCarousel && window.newsCarousel.isInitialized) {
            window.newsCarousel.refresh();
        }
    }, 150);
});

// Make class available globally
window.NewsCarousel = NewsCarousel;

// Export for module systems
export default NewsCarousel;