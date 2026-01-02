/**
 * YouTube Carousel with Slick Slider - NPM Version
 * Importuje slick-carousel z node_modules
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
 * YouTube Carousel Class
 */

class MovieHandler {
  bindEvents() {
    // Metoda tworząca slug z tytułu filmu
    const createSlugFromMovieTitle = (title) => {
      if (!title || typeof title !== 'string') {
        return '';
      }
      
      return title
        .toLowerCase() // zamień na małe litery
        .trim() // usuń spacje z początku i końca
        .replace(/[ąćęłńóśźż]/g, function(match) { // zamień polskie znaki
          const polishChars = {
            'ą': 'a', 'ć': 'c', 'ę': 'e', 'ł': 'l', 
            'ń': 'n', 'ó': 'o', 'ś': 's', 'ź': 'z', 'ż': 'z'
          };
          return polishChars[match] || match;
        })
        .replace(/[^a-z0-9\s-]/g, '') // usuń znaki specjalne (zostaw litery, cyfry, spacje i myślniki)
        .replace(/\s+/g, '-') // zamień spacje na myślniki
        .replace(/-+/g, '-') // zamień wielokrotne myślniki na pojedyncze
        .replace(/^-|-$/g, ''); // usuń myślniki z początku i końca
    };

    // Przypisz funkcję do instancji
    this.createSlug = createSlugFromMovieTitle;
  }
}

const movieHandler = new MovieHandler();
movieHandler.bindEvents();

class YouTubeCarousel {
    constructor(options = {}) {
        // Konfiguracja
        this.config = {
            carouselId: 'youtubeCarousel',
            modalId: 'youtubeModal',
            autoplay: true,
            showRelated: false,
            keyboardNavigation: true,
            ...options
        };

        // Stan carousel
        this.currentVideo = 0;
        this.videos = [];
        
        // Elementy DOM
        this.carousel = null;
        this.$carousel = null;
        this.modal = null;
        this.modalVideo = null;
        
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
            // console.log('Starting YouTube Carousel initialization...');
            
            this.getElements();
            // console.log('✓ Elements found');
            
            this.extractVideoData();
            // console.log('✓ Video data extracted:', this.videos.length, 'videos');
            
            // Bind events BEFORE Slick initialization
           
            
            this.setupAccessibility();
            // console.log('✓ Accessibility setup');
            
            await this.initSlickCarousel();
            // console.log('✓ Slick initialized');
            
            this.isInitialized = true;
            // console.log('✅ YouTube Carousel initialized successfully');

            window.dispatchEvent(new CustomEvent('sliderInitialized', {
                detail: { type: 'youtube', instance: this }
            }));

             this.bindEvents();
            // console.log('✓ Events bound');
        } catch (error) {
            // console.error('❌ YouTube Carousel initialization failed:', error);
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
        this.slides = Array.from(this.carousel.querySelectorAll('.youtube-slide'));

        // Modal elements
        this.modal = document.getElementById(this.config.modalId);
        this.modalVideo = document.getElementById('modalVideo');
        this.modalTitle = document.getElementById('modalTitle');
        this.modalClose = document.getElementById('modalClose');
        this.modalPrev = document.getElementById('modalPrev');
        this.modalNext = document.getElementById('modalNext');
        this.thumbnailsContainer = document.getElementById('thumbnailsContainer');

        if (this.slides.length === 0) {
            throw new Error('No slides found in carousel');
        }
    }

    /**
     * Wyciąganie danych o filmach z DOM
     */
    extractVideoData() {
        this.videos = this.slides.map((slide, index) => ({
            id: slide.dataset.index || index,
            title: slide.dataset.title || `Video ${index + 1}`,
            youtube_id: slide.dataset.videoId,
            thumbnail: `https://img.youtube.com/vi/${slide.dataset.videoId}/hqdefault.jpg`,
            thumbnailHQ: `https://img.youtube.com/vi/${slide.dataset.videoId}/maxresdefault.jpg`
        }));

        if (this.videos.length === 0) {
            throw new Error('No video data found');
        }

        // console.log(`Found ${this.videos.length} videos for carousel`);
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

                // Konfiguracja Slick Carousel
                const slickConfig = {
                    slidesToShow: 2, // Desktop: 2 pełne + kawałek trzeciego
                    slidesToScroll: 1,
                    infinite: false,
                    arrows: true,
                    dots: false,
                    speed: 500,
                    autoplay: true,
                    autoplaySpeed: 5000,
                     infinite: true,
                    cssEase: 'cubic-bezier(0.25, 0.46, 0.45, 0.94)',
                    adaptiveHeight: false,
                    variableWidth: false,
                    centerMode: false,
                    focusOnSelect: true,
                    accessibility: true,
                    draggable: true,
                    swipe: true,
                    touchMove: true,
                    useTransform: true,
                    pauseOnHover:false,
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
                                slidesToShow: 1
                            }
                        },
                        {
                            breakpoint: 768,
                            settings: {
                                slidesToShow: 1,
                                arrows: true
                            }
                        },
                        {
                            breakpoint: 576,
                            settings: {
                                slidesToShow: 1,
                                arrows: true
                            }
                        },
                        {
                            breakpoint: 480,
                            settings: {
                                slidesToShow: 1,
                                arrows: false,
                                dots: true
                            }
                        }
                    ]
                };

                // console.log('Slick config:', slickConfig);

                // Initialize Slick
                this.$carousel.slick(slickConfig);
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
        
        this.$carousel.addClass('slick-initialized-custom');
        this.setupLazyLoading();

        // Bind Slick-specific events
        this.$carousel.on('afterChange', (event, slick, currentSlide) => {
            this.onSlideChange(currentSlide);
        });

        this.$carousel.on('beforeChange', (event, slick, currentSlide, nextSlide) => {
            this.onBeforeSlideChange(currentSlide, nextSlide);
        });

        // console.log('✓ Post-Slick setup complete');
    }

    /**
     * Setup lazy loading for images
     */
    setupLazyLoading() {
        if ('IntersectionObserver' in window) {
            const imageObserver = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const img = entry.target;
                        if (img.dataset.src) {
                            img.src = img.dataset.src;
                            img.removeAttribute('data-src');
                            img.classList.remove('lazy');
                            imageObserver.unobserve(img);
                        }
                    }
                });
            });

            const lazyImages = this.carousel.querySelectorAll('img[data-src]');
            lazyImages.forEach(img => imageObserver.observe(img));
        }
    }

    

    /**
     * Bindowanie event handlerów
     */
    bindEvents() {
        // console.log('Binding events...');
        
        // Slide clicks
        // console.log('Binding slide clicks for', this.slides.length, 'slides');
        this.slides.forEach((slide, index) => {
            $(slide).on('click', (e) => {  // ✅ Arrow function
                e.preventDefault();
                // console.log('Slide clicked:', index);
                this.openModal(index);  // ✅ Teraz 'this' odnosi się do klasy

                
                var hash = '#'+movieHandler.createSlug(slide.dataset.title);
         
                

                window.history.replaceState(null, null, hash);
            });

            // Keyboard events dla slajdów
            $(slide).on('keydown', (e) => {
                if (e.key === 'Enter' || e.key === ' ') {
                    e.preventDefault();
                    // console.log('Slide activated via keyboard:', index);
                    this.openModal(index);
                }
            });
        });

        // Modal events
        // console.log('Modal elements check:');
        // console.log('- modalClose:', !!this.modalClose);
        // console.log('- modalPrev:', !!this.modalPrev);
        // console.log('- modalNext:', !!this.modalNext);
        // console.log('- modal:', !!this.modal);
        // console.log('- thumbnailsContainer:', !!this.thumbnailsContainer);

        if (this.modalClose) {
            $(this.modalClose).on('click', (e) => {
                e.preventDefault();
                // console.log('Modal close clicked');
                this.closeModal();
            });
            // console.log('✓ Modal close event bound');
        } else {
            // console.warn('⚠️ Modal close element not found');
        }

        if (this.modalPrev) {
            $(this.modalPrev).on('click', (e) => {
                e.preventDefault();
                // console.log('Modal prev clicked');
                this.prevVideo();
            });
            // console.log('✓ Modal prev event bound');
        }

        if (this.modalNext) {
            $(this.modalNext).on('click', (e) => {
                e.preventDefault();
                // console.log('Modal next clicked');
                this.nextVideo();
            });
            // console.log('✓ Modal next event bound');
        }

        // Thumbnail clicks
        if (this.thumbnailsContainer) {
            $(this.thumbnailsContainer).on('click', '.thumbnail-item', (e) => {
                e.preventDefault();
                const index = parseInt(e.currentTarget.dataset.index);
                // console.log('Thumbnail clicked:', index);
                this.switchVideo(index);
            });
            // console.log('✓ Thumbnail events bound');
        }

        // Modal backdrop click
        if (this.modal) {
            $(this.modal).on('click', (e) => {
                if (e.target === this.modal || $(e.target).hasClass('modal-backdrop')) {
                    // console.log('Modal backdrop clicked');
                    this.closeModal();
                }
            });
            // console.log('✓ Modal backdrop event bound');
        }

        // Keyboard navigation
        if (this.config.keyboardNavigation) {
            $(document).on('keydown.youtubeCarousel', (e) => this.handleKeyboard(e));
            // console.log('✓ Keyboard navigation bound');
        }

        if (this.modal) {
            $(this.modal).on('keydown', (e) => this.handleModalKeyboard(e));
            // console.log('✓ Modal keyboard events bound');
        }

        // console.log('✅ All events bound successfully');
    }

    /**
     * Callback dla zmiany slajdu
     */
    onSlideChange(currentSlide) {
        // console.log('Slide changed to:', currentSlide);
        this.trackSlideChange(currentSlide);
    }

    /**
     * Callback przed zmianą slajdu
     */
    onBeforeSlideChange(currentSlide, nextSlide) {
        // console.log('Slide changing from', currentSlide, 'to', nextSlide);
    }

    /**
     * Obsługa klawiatury
     */
    handleKeyboard(e) {
        if (this.modal && $(this.modal).hasClass('active')) {
            switch (e.key) {
                case 'Escape':
                    e.preventDefault();
                    this.closeModal();
                    break;
                case 'ArrowLeft':
                    e.preventDefault();
                    this.prevVideo();
                    break;
                case 'ArrowRight':
                    e.preventDefault();
                    this.nextVideo();
                    break;
            }
        } else {
            switch (e.key) {
                case 'ArrowLeft':
                    if (this.isCarouselFocused()) {
                        e.preventDefault();
                        this.prevSlide();
                    }
                    break;
                case 'ArrowRight':
                    if (this.isCarouselFocused()) {
                        e.preventDefault();
                        this.nextSlide();
                    }
                    break;
            }
        }
    }

    isCarouselFocused() {
        return document.activeElement === this.carousel || 
               this.carousel.contains(document.activeElement);
    }

    handleModalKeyboard(e) {
        if (e.key === 'Tab') {
            const focusableElements = this.modal.querySelectorAll(
                'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])'
            );
            const firstElement = focusableElements[0];
            const lastElement = focusableElements[focusableElements.length - 1];

            if (e.shiftKey) {
                if (document.activeElement === firstElement) {
                    e.preventDefault();
                    lastElement.focus();
                }
            } else {
                if (document.activeElement === lastElement) {
                    e.preventDefault();
                    firstElement.focus();
                }
            }
        }
    }

    handleResize() {
        if (this.slickInitialized) {
            // console.log('Handling carousel resize');
        }
    }

    setupAccessibility() {
        if (this.carousel) {
            this.carousel.setAttribute('role', 'region');
            this.carousel.setAttribute('aria-label', 'Carousel z filmami YouTube');
        }

        this.slides.forEach((slide, index) => {
            slide.setAttribute('tabindex', '0');
            slide.setAttribute('role', 'button');
            slide.setAttribute('aria-label', `Odtwórz film: ${this.videos[index].title}`);
        });

        if (this.modal) {
            this.modal.setAttribute('role', 'dialog');
            this.modal.setAttribute('aria-modal', 'true');
            this.modal.setAttribute('aria-labelledby', 'modalTitle');
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
        if (this.slickInitialized && slideIndex >= 0 && slideIndex < this.videos.length) {
            this.$carousel.slick('slickGoTo', slideIndex);
        }
    }

    getCurrentSlide() {
        if (this.slickInitialized) {
            return this.$carousel.slick('slickCurrentSlide');
        }
        return 0;
    }

    // Modal methods
    openModal(index) {
        // console.log('🎬 Opening modal for video index:', index);
        
        if (!this.modal) {
            console.error('❌ Modal element not found!');
            return;
        }
        
        if (!this.modalVideo) {
            console.error('❌ Modal video element not found!');
            return;
        }

        if (index < 0 || index >= this.videos.length) {
            console.error('❌ Invalid video index:', index);
            return;
        }

        this.currentVideo = index;
        const video = this.videos[index];
        
        // console.log('📹 Video data:', video);
        
        if (this.modalTitle) {
            this.modalTitle.textContent = video.title;
            // console.log('✓ Modal title set:', video.title);
        } else {
            // console.warn('⚠️ Modal title element not found');
        }
        
        const params = new URLSearchParams({
            rel: '0',           // Tylko powiązane z tego kanału
            modestbranding: '1', // Bez logo YouTube
            showinfo: '0',      // Bez info (dla starszych wersji)
            controls: '1',      // Z kontrolkami
            fs: '1'            // Z opcją pełnego ekranu
        });


        
        const videoUrl = `https://www.youtube.com/embed/${video.youtube_id}?${params.toString()}`;
        // console.log('🔗 Video URL:', videoUrl);
        
        this.modalVideo.src = videoUrl;
        
        // Show modal
        // console.log('👁️ Showing modal...');
        $(this.modal).addClass('active');
        $('body').css('overflow', 'hidden');
        
        // console.log('📱 Modal classes after show:', this.modal.className);
        
        this.updateThumbnails();
        this.updateModalNavigation();
        
        if (this.modalClose) {
            setTimeout(() => {
                this.modalClose.focus();
                // console.log('🎯 Focus set to modal close button');
            }, 100);
        }
        
        this.trackVideoView(video);
        // console.log('✅ Modal opened successfully');
    }

    closeModal() {
        // console.log('❌ Closing modal...');
        
        if (!this.modal) {
            // console.error('❌ Modal element not found during close!');
            return;
        }

        $(this.modal).removeClass('active');
        // console.log('👁️ Modal hidden');
        
        if (this.modalVideo) {
            this.modalVideo.src = '';
            // console.log('📹 Video source cleared');
        }
        
        $('body').css('overflow', 'auto');
        // console.log('📄 Body overflow restored');
        
        const clickedSlide = this.slides[this.currentVideo];
        if (clickedSlide) {
            clickedSlide.focus();
            // console.log('🎯 Focus returned to slide:', this.currentVideo);
        }
        
        // console.log('✅ Modal closed successfully');
    }

    prevVideo() {
        if (this.currentVideo > 0) {
            this.switchVideo(this.currentVideo - 1);
        }
    }

    nextVideo() {
        if (this.currentVideo < this.videos.length - 1) {
            this.switchVideo(this.currentVideo + 1);
        }
    }

    switchVideo(index) {
        if (index < 0 || index >= this.videos.length) return;

        this.currentVideo = index;
        const video = this.videos[index];
        
        if (this.modalTitle) {
            this.modalTitle.textContent = video.title;
        }
        
        if (this.modalVideo) {
            const params = new URLSearchParams({
                autoplay: this.config.autoplay ? '1' : '0',
                rel: this.config.showRelated ? '1' : '0',
                modestbranding: '1',
                iv_load_policy: '3'
            });
            
            this.modalVideo.src = `https://www.youtube.com/embed/${video.youtube_id}?${params.toString()}`;
        }
        
        this.updateThumbnails();
        this.updateModalNavigation();
        this.trackVideoView(video);
    }

    updateThumbnails() {
        if (!this.thumbnailsContainer) return;

        const thumbnails = this.thumbnailsContainer.querySelectorAll('.thumbnail-item');
        thumbnails.forEach((thumb, index) => {
            $(thumb).toggleClass('active', index === this.currentVideo);
        });

        const activeThumb = thumbnails[this.currentVideo];
        if (activeThumb) {
            activeThumb.scrollIntoView({ 
                behavior: 'smooth', 
                block: 'nearest',
                inline: 'center'
            });
        }
    }

    updateModalNavigation() {
        if (this.modalPrev) {
            this.modalPrev.disabled = this.currentVideo <= 0;
            $(this.modalPrev).css('opacity', this.currentVideo <= 0 ? '0.3' : '1');
        }
        
        if (this.modalNext) {
            this.modalNext.disabled = this.currentVideo >= this.videos.length - 1;
            $(this.modalNext).css('opacity', this.currentVideo >= this.videos.length - 1 ? '0.3' : '1');
        }
    }

    // Analytics
    trackVideoView(video) {
        if (typeof gtag !== 'undefined') {
            gtag('event', 'video_play', {
                video_title: video.title,
                video_id: video.youtube_id,
                video_provider: 'youtube'
            });
        }
        
        if (typeof ga !== 'undefined') {
            ga('send', 'event', 'Video', 'Play', video.title);
        }

          if (typeof fbq !== 'undefined') {
            fbq('trackCustom', 'MovieView', {
            content_category: 'YouTube_Video',
            content_type: 'youtube_video',
            content_name: video.title,
            timestamp: new Date().toISOString()
            });
        }
        
        // console.log('Video played:', video.title, video.youtube_id);
    }

    trackSlideChange(slideIndex) {
        // if (typeof gtag !== 'undefined') {
        //     gtag('event', 'carousel_slide_change', {
        //         slide_index: slideIndex,
        //         total_slides: this.videos.length
        //     });
        // }
    }

    // Public API
    getTotalSlides() {
        return this.videos.length;
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
        if (this.slickInitialized) {
            this.$carousel.slick('slickPlay');
        }
    }

    destroy() {
        if (this.slickInitialized) {
            this.$carousel.slick('unslick');
            this.slickInitialized = false;
        }

        $(document).off('keydown');
        $(window).off('resize');
        
        this.isInitialized = false;
        // console.log('YouTube Carousel destroyed');
    }
}

/**
 * Auto-initialize when DOM is ready
 */
$(document).ready(function() {
    // console.log('🚀 YouTube Carousel module gtag');
    // console.log('📊 jQuery version:', $.fn.jquery);
    // console.log('🎠 Slick available:', typeof $.fn.slick);
    
    const carouselElement = document.getElementById('youtubeCarousel');
    
    if (carouselElement) {
        // console.log('🎯 Carousel element found:', carouselElement);
        
        // Check if modal exists
        const modalElement = document.getElementById('youtubeModal');
        // console.log('🔍 Modal element found:', !!modalElement);
        
        try {
            window.youtubeCarousel = new YouTubeCarousel({
                carouselId: 'youtubeCarousel',
                modalId: 'youtubeModal',
                autoplay: true,
                showRelated: false,
                keyboardNavigation: true
            });
            
            // console.log('🎉 YouTube Carousel initialized successfully');
            // console.log('📋 Instance available at: window.youtubeCarousel');
        } catch (error) {
            // console.error('💥 Failed to initialize YouTube Carousel:', error);
            // console.log('🔧 Debug info:');
            // console.log('- Carousel element:', carouselElement);
            // console.log('- Modal element:', modalElement);
            // console.log('- Slides found:', carouselElement.querySelectorAll('.youtube-slide').length);
        }
    } else {
        // console.log('ℹ️ YouTube Carousel element not found on this page');
        // console.log('🔍 Looking for element with ID: youtubeCarousel');
    }
});

/**
 * Handle page resize with debounce
 */
let resizeTimer;
$(window).on('resize', function() {
    clearTimeout(resizeTimer);
    resizeTimer = setTimeout(function() {
        if (window.youtubeCarousel && window.youtubeCarousel.isInitialized) {
            window.youtubeCarousel.handleResize();
        }
    }, 150);
});



// Make class available globally
window.YouTubeCarousel = YouTubeCarousel;

// Export for module systems
export default YouTubeCarousel;

$(document).ready(function(){
    
    // Najpierw załaduj wszystkie obrazki przed inicjalizacją slidera
    loadAllImages();
    
    $('.homepage-section__baners').slick({
        // Podstawowe ustawienia
        dots: false,
        infinite: true,
        speed: 800,
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 4000,
        arrows: true,
        
        // Animacja fade
        fade: true,
        cssEase: 'linear',
        
        // Wyłącz lazy loading - wszystko ładujemy od razu
        lazyLoad: 'ondemand', // Można pozostawić ale nie będzie używane
        
        // Responsywne ustawienia
        responsive: [
            {
                breakpoint: 1024,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    arrows: true,
                    dots: false
                }
            },
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    arrows: true,
                    dots: false,
                    adaptiveHeight: true
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    arrows: true,
                    dots: false,
                    adaptiveHeight: true
                }
            }
        ],
        
        // Callback functions
        beforeChange: function(event, slick, currentSlide, nextSlide) {
            console.log('Changing from slide ' + currentSlide + ' to slide ' + nextSlide);
        },
        
        afterChange: function(event, slick, currentSlide) {
            console.log('Changed to slide ' + currentSlide);
        }
    });
});

// Funkcja do załadowania wszystkich obrazków od razu
function loadAllImages() {
    console.log('Loading all images...');
    
    $('.homepage-section__baners img[data-src]').each(function() {
        var $img = $(this);
        var dataSrc = $img.data('src');
        
        if (dataSrc && !$img.attr('src')) {
            console.log('Loading image:', dataSrc);
            $img.attr('src', dataSrc);
            $img.removeClass('lazyload');
            
            // Opcjonalnie: dodaj klasę loaded po załadowaniu
            $img.on('load', function() {
                $(this).addClass('loaded');
                console.log('Image loaded:', dataSrc);
            }).on('error', function() {
                console.error('Failed to load image:', dataSrc);
            });
        }
    });
}