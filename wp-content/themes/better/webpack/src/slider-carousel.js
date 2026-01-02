/**
 * Main Slider Carousel with Slick Slider
 * Bazuje na kodzie YouTube carousel ale dla zwykłych slajdów
 */

// Import jQuery (jeśli nie jest globalnie dostępne)
import $ from 'jquery';

// Import Slick Carousel
import 'slick-carousel';

// Import Slick CSS
import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';

// Make jQuery available globally if needed
window.$ = window.jQuery = $;

/**
 * Main Slider Carousel Class
 */
class SliderCarousel {
    constructor(options = {}) {
        // Konfiguracja
        this.config = {
            sliderId: 'mainSlider',
            autoplay: true,
            autoplaySpeed: 5000,
            arrows: true,
            dots: false,
            fade: true, // Efekt fade dla głównego slidera
            keyboardNavigation: true,
            pauseOnHover: true,
            ...options
        };

        // Stan carousel
        this.currentSlide = 0;
        this.slides = [];
        
        // Elementy DOM
        this.slider = null;
        this.$slider = null;
        this.sliderDots = null;
        this.sliderPrev = null;
        this.sliderNext = null;
        
        // Flagi
        this.isInitialized = false;
        this.slickInitialized = false;

        setTimeout(() => {
            this.init();
        },500);
    }

    /**
     * Inicjalizacja carousel
     */
    async init() {
        try {
            // console.log('Starting Slider Carousel initialization...');
            
            this.getElements();
            // console.log('✓ Elements found');
            
            this.extractSlideData();
            // console.log('✓ Slide data extracted:', this.slides.length, 'slides');
            
            this.setupAccessibility();
            // console.log('✓ Accessibility setup');
            
            await this.initSlickCarousel();
            // console.log('✓ Slick initialized');
            
            this.bindEvents();
            // console.log('✓ Events bound');

            this.isInitialized = true;
        
            // ← DODAJ TEN EVENT
            window.dispatchEvent(new CustomEvent('sliderInitialized', {
                detail: { type: 'main', instance: this }
            }));
            
            // console.log('✅ Slider Carousel initialized successfully');

        } catch (error) {
            // console.error('❌ Slider Carousel initialization failed:', error);
            throw error;
        }
    }

    /**
     * Pobieranie elementów DOM
     */
    getElements() {
        this.slider = document.getElementById(this.config.sliderId);
        if (!this.slider) {
            throw new Error(`Slider element with ID "${this.config.sliderId}" not found`);
        }

        this.$slider = $(this.slider);
        this.slideElements = Array.from(this.slider.querySelectorAll('.slider-slide'));

        // Navigation elements
        this.sliderPrev = document.getElementById('sliderPrev');
        this.sliderNext = document.getElementById('sliderNext');
        this.sliderDots = document.querySelectorAll('.slider-dot');

        if (this.slideElements.length === 0) {
            throw new Error('No slides found in slider');
        }
    }

    /**
     * Wyciąganie danych o slajdach z DOM
     */
    extractSlideData() {
        this.slides = this.slideElements.map((slide, index) => {
            const img = slide.querySelector('.slide-image');
            const title = slide.querySelector('.slide-title');
            const description = slide.querySelector('.slide-description');
            const button = slide.querySelector('.slide-button');
            
            return {
                id: slide.dataset.index || index,
                title: title ? title.textContent : `Slide ${index + 1}`,
                description: description ? description.textContent : '',
                image: img ? img.src : '',
                button: button ? {
                    text: button.textContent,
                    url: button.href,
                    target: button.target
                } : null
            };
        });

        if (this.slides.length === 0) {
            throw new Error('No slide data found');
        }

        // console.log(`Found ${this.slides.length} slides for carousel`);
    }

    /**
     * Inicjalizacja Slick Carousel
     */
    async initSlickCarousel() {
        return new Promise((resolve, reject) => {
            try {
                // console.log('Initializing Slick Carousel...');
                
                // Sprawdź czy Slick jest dostępny
                if (!$.fn.slick) {
                    throw new Error('Slick Carousel not found. Make sure it\'s imported.');
                }

                // Konfiguracja Slick Carousel dla głównego slidera
                const slickConfig = {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    infinite: true,
                    autoplay: this.config.autoplay,
                    autoplaySpeed: this.config.autoplaySpeed,
                    fade: this.config.fade,
                    speed: 1000,
                    cssEase: 'cubic-bezier(0.25, 0.46, 0.45, 0.94)',
                    arrows: false, // Używamy własnych strzałek
                    dots: false,   // Używamy własnych kropek
                    pauseOnHover: this.config.pauseOnHover,
                    pauseOnFocus: true,
                    accessibility: true,
                    draggable: true,
                    swipe: true,
                    touchMove: true,
                    useTransform: true,
                    lazyLoad: 'ondemand',
                    responsive: [
                        {
                            breakpoint: 768,
                            settings: {
                                swipe: true,
                                touchMove: true
                            }
                        }
                    ]
                };

                // console.log('Slick config:', slickConfig);

                // Initialize Slick
                this.$slider.slick(slickConfig);
                this.slickInitialized = true;

                // console.log('✓ Slick Carousel initialized');

                // Setup additional features
                this.onSlickInit();
                
                // Resolve immediately after initialization
                resolve();
                
            } catch (error) {
                // console.error('❌ Failed to initialize Slick Carousel:', error);
                reject(error);
            }
        });
    }

    /**
     * Callback po inicjalizacji Slick
     */
    onSlickInit() {
        // console.log('Setting up post-Slick features...');
        
        this.$slider.addClass('slick-initialized-custom');

        // Bind Slick-specific events
        this.$slider.on('afterChange', (event, slick, currentSlide) => {
            this.onSlideChange(currentSlide);
        });

        this.$slider.on('beforeChange', (event, slick, currentSlide, nextSlide) => {
            this.onBeforeSlideChange(currentSlide, nextSlide);
        });

        // Trigger animations for first slide
        this.triggerSlideAnimations(0);

        // console.log('✓ Post-Slick setup complete');
    }

    /**
     * Bindowanie event handlerów
     */
    bindEvents() {
        // console.log('Binding events...');
        
        // Custom navigation buttons
        if (this.sliderPrev) {
            $(this.sliderPrev).on('click', (e) => {
                e.preventDefault();
                this.prevSlide();
            });
        }

        if (this.sliderNext) {
            $(this.sliderNext).on('click', (e) => {
                e.preventDefault();
                this.nextSlide();
            });
        }

        // Custom dots
        this.sliderDots.forEach((dot, index) => {
            $(dot).on('click', (e) => {
                e.preventDefault();
                this.goToSlide(index);
            });
        });

        // Keyboard navigation
        if (this.config.keyboardNavigation) {
            $(document).on('keydown.sliderCarousel', (e) => this.handleKeyboard(e));
        }

        // Update dots on slide change
        this.$slider.on('afterChange', (event, slick, currentSlide) => {
            this.updateDots(currentSlide);
        });

        // console.log('✅ All events bound successfully');
    }

    /**
     * Callback dla zmiany slajdu
     */
    onSlideChange(currentSlide) {
        this.currentSlide = currentSlide;
        this.updateDots(currentSlide);
        this.triggerSlideAnimations(currentSlide);
        this.trackSlideChange(currentSlide);
    }

    /**
     * Callback przed zmianą slajdu
     */
    onBeforeSlideChange(currentSlide, nextSlide) {
        // Reset animacji poprzedniego slajdu
        this.resetSlideAnimations(currentSlide);
    }

    /**
     * Aktualizacja kropek nawigacji
     */
    updateDots(activeSlide) {
        this.sliderDots.forEach((dot, index) => {
            $(dot).toggleClass('active', index === activeSlide);
        });
    }

    /**
     * Uruchomienie animacji dla slajdu
     */
    triggerSlideAnimations(slideIndex) {
        const slide = this.slideElements[slideIndex];
        if (!slide) return;

        // Reset wszystkich animacji
        this.slideElements.forEach(s => {
            $(s).find('.slide-title, .slide-description, .slide-button-container').removeClass('animate-in');
        });

        // Uruchom animacje dla aktywnego slajdu
        setTimeout(() => {
            $(slide).find('.slide-title').addClass('animate-in');
        }, 100);

        setTimeout(() => {
            $(slide).find('.slide-description').addClass('animate-in');
        }, 300);

        setTimeout(() => {
            $(slide).find('.slide-button-container').addClass('animate-in');
        }, 500);
    }

    /**
     * Reset animacji slajdu
     */
    resetSlideAnimations(slideIndex) {
        const slide = this.slideElements[slideIndex];
        if (!slide) return;

        $(slide).find('.slide-title, .slide-description, .slide-button-container').removeClass('animate-in');
    }

    /**
     * Obsługa klawiatury
     */
    handleKeyboard(e) {
        if (!this.isSliderFocused()) return;

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
                this.goToSlide(this.slides.length - 1);
                break;
        }
    }

    /**
     * Sprawdza czy slider jest w fokusie
     */
    isSliderFocused() {
        return document.activeElement === this.slider || 
               this.slider.contains(document.activeElement);
    }

    /**
     * Setup accessibility
     */
    setupAccessibility() {
        if (this.slider) {
            this.slider.setAttribute('role', 'region');
            this.slider.setAttribute('aria-label', 'Główny slider strony');
        }

        this.slideElements.forEach((slide, index) => {
            slide.setAttribute('aria-label', `Slajd ${index + 1} z ${this.slides.length}: ${this.slides[index].title}`);
        });

        // Navigation buttons
        if (this.sliderPrev) {
            this.sliderPrev.setAttribute('aria-label', 'Poprzedni slajd');
        }
        if (this.sliderNext) {
            this.sliderNext.setAttribute('aria-label', 'Następny slajd');
        }

        // Dots
        this.sliderDots.forEach((dot, index) => {
            dot.setAttribute('aria-label', `Przejdź do slajdu ${index + 1}`);
        });
    }

    // Slick API methods
    prevSlide() {
        if (this.slickInitialized) {
            this.$slider.slick('slickPrev');
        }
    }

    nextSlide() {
        if (this.slickInitialized) {
            this.$slider.slick('slickNext');
        }
    }

    goToSlide(slideIndex) {
        if (this.slickInitialized && slideIndex >= 0 && slideIndex < this.slides.length) {
            this.$slider.slick('slickGoTo', slideIndex);
        }
    }

    getCurrentSlide() {
        if (this.slickInitialized) {
            return this.$slider.slick('slickCurrentSlide');
        }
        return 0;
    }

    // Control methods
    pause() {
        if (this.slickInitialized) {
            this.$slider.slick('slickPause');
        }
    }

    play() {
        if (this.slickInitialized) {
            this.$slider.slick('slickPlay');
        }
    }

    refresh() {
        if (this.slickInitialized) {
            this.$slider.slick('refresh');
        }
    }

    // Analytics
    trackSlideChange(slideIndex) {
        // if (typeof gtag !== 'undefined') {
        //     gtag('event', 'slider_slide_change', {
        //         slide_index: slideIndex,
        //         slide_title: this.slides[slideIndex]?.title,
        //         total_slides: this.slides.length
        //     });
        // }
        
        // if (typeof ga !== 'undefined') {
        //     ga('send', 'event', 'Slider', 'Slide Change', this.slides[slideIndex]?.title);
        // }
        
        // console.log('Slide changed to:', slideIndex, this.slides[slideIndex]?.title);
    }

    // Public API
    getTotalSlides() {
        return this.slides.length;
    }

    getSlideData(index) {
        return this.slides[index] || null;
    }

    destroy() {
        if (this.slickInitialized) {
            this.$slider.slick('unslick');
            this.slickInitialized = false;
        }

        $(document).off('keydown.sliderCarousel');
        $(window).off('resize.sliderCarousel');
        
        this.isInitialized = false;
        // console.log('Slider Carousel destroyed');
    }
}

/**
 * Auto-initialize when DOM is ready
 */
$(document).ready(function() {
    // console.log('🚀 Slider Carousel module loaded');
    // console.log('📊 jQuery version:', $.fn.jquery);
    // console.log('🎠 Slick available:', typeof $.fn.slick);
    
    const sliderElement = document.getElementById('mainSlider');
    
    if (sliderElement) {
        // console.log('🎯 Slider element found:', sliderElement);
        
        try {
            window.sliderCarousel = new SliderCarousel({
                sliderId: 'mainSlider',
                autoplay: true,
                autoplaySpeed: 5000,
                arrows: true,
                dots: false,
                fade: true, 
                keyboardNavigation: true,
                pauseOnHover: false
            });
            
            // console.log('🎉 Slider Carousel initialized successfully');
            // console.log('📋 Instance available at: window.sliderCarousel');
        } catch (error) {
            // console.error('💥 Failed to initialize Slider Carousel:', error);
            // console.log('🔧 Debug info:');
            // console.log('- Slider element:', sliderElement);
            // console.log('- Slides found:', sliderElement.querySelectorAll('.slider-slide').length);
        }
    } else {
        // console.log('ℹ️ Main Slider element not found on this page');
        // console.log('🔍 Looking for element with ID: mainSlider');
    }
});

/**
 * Handle page resize with debounce
 */
let resizeTimer;
$(window).on('resize.sliderCarousel', function() {
    clearTimeout(resizeTimer);
    resizeTimer = setTimeout(function() {
        if (window.sliderCarousel && window.sliderCarousel.isInitialized) {
            window.sliderCarousel.refresh();
        }
    }, 150);
});

// Make class available globally
window.SliderCarousel = SliderCarousel;

// Export for module systems
export default SliderCarousel;