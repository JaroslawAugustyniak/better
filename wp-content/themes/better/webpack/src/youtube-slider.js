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
            this.getElements();
            this.extractVideoData();
            this.setupAccessibility();
            await this.initSlickCarousel();
            this.isInitialized = true;

            window.dispatchEvent(new CustomEvent('sliderInitialized', {
                detail: { type: 'youtube', instance: this }
            }));

             this.bindEvents();
        } catch (error) {
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
        this.videos = this.slides.map((slide, index) => {
            const youtubeId = slide.dataset.videoId;
            const vimeoId = slide.dataset.vimeoId;
            const isVimeo = vimeoId && !youtubeId;
            const isYoutube = youtubeId && !vimeoId;

            return {
                id: slide.dataset.index || index,
                title: slide.dataset.title || `Video ${index + 1}`,
                youtube_id: youtubeId,
                vimeo_id: vimeoId,
                type: isVimeo ? 'vimeo' : isYoutube ? 'youtube' : 'unknown',
                thumbnail: youtubeId ? `https://img.youtube.com/vi/${youtubeId}/hqdefault.jpg` : '',
                thumbnailHQ: youtubeId ? `https://img.youtube.com/vi/${youtubeId}/maxresdefault.jpg` : ''
            };
        });

        if (this.videos.length === 0) {
            throw new Error('No video data found');
        }
    }

    /**
     * Inicjalizacja Slick Carousel
     */
    async initSlickCarousel() {
        return new Promise((resolve, reject) => {
            try {
                if (!$.fn.slick) {
                    throw new Error('Slick Carousel not found. Make sure it\'s imported.');
                }
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

                this.$carousel.slick(slickConfig);
                this.slickInitialized = true;

                this.onSlickInit();
                resolve();

            } catch (error) {
                reject(error);
            }
        });
    }

    /**
     * Callback po inicjalizacji Slick
     */
    onSlickInit() {
        this.$carousel.addClass('slick-initialized-custom');
        this.setupLazyLoading();
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
        console.log('VIDEO');
        this.slides.forEach((slide, index) => {
            const playButton = slide.querySelector('.play-button');
            let lastTouchTime = 0;

            const openModalHandler = (e) => {
                e.preventDefault();
                e.stopPropagation();
                this.openModal(index);
                var hash = '#'+movieHandler.createSlug(slide.dataset.title);
                window.history.replaceState(null, null, hash);
            };

            if (playButton) {
                // Handle touch events - using vanilla addEventListener
                playButton.addEventListener('touchend', (e) => {
                    lastTouchTime = Date.now();
                    openModalHandler(e);
                });

                // Handle click events (ignore emulated ones from touch)
                playButton.addEventListener('click', (e) => {
                    // Ignore emulated click if touchend fired recently
                    if (Date.now() - lastTouchTime < 300) {
                        return;
                    }
                    openModalHandler(e);
                });
            }

            // Handle touch events
            slide.addEventListener('touchend', (e) => {
                lastTouchTime = Date.now();
                if (!e.target.closest('.play-button')) {
                    e.preventDefault();
                    this.openModal(index);
                    var hash = '#'+movieHandler.createSlug(slide.dataset.title);
                    window.history.replaceState(null, null, hash);
                }
            });

            // Handle click events
            slide.addEventListener('click', (e) => {
                // Ignore emulated click if touchend fired recently
                if (Date.now() - lastTouchTime < 300) return;
                if (!e.target.closest('.play-button')) {
                    e.preventDefault();
                    this.openModal(index);
                    var hash = '#'+movieHandler.createSlug(slide.dataset.title);
                    window.history.replaceState(null, null, hash);
                }
            });

            // Keyboard events dla slajdów
            slide.addEventListener('keydown', (e) => {
                if (e.key === 'Enter' || e.key === ' ') {
                    e.preventDefault();
                    this.openModal(index);
                }
            });
        });

        if (this.modalClose) {
            $(this.modalClose).on('click', (e) => {
                e.preventDefault();
                this.closeModal();
            });
        }

        if (this.modalPrev) {
            $(this.modalPrev).on('click', (e) => {
                e.preventDefault();
                this.prevVideo();
            });
        }

        if (this.modalNext) {
            $(this.modalNext).on('click', (e) => {
                e.preventDefault();
                this.nextVideo();
            });
        }

        if (this.thumbnailsContainer) {
            $(this.thumbnailsContainer).on('click', '.thumbnail-item', (e) => {
                e.preventDefault();
                const index = parseInt(e.currentTarget.dataset.index);
                this.switchVideo(index);
            });
        }

        if (this.modal) {
            $(this.modal).on('click', (e) => {
                if (e.target === this.modal || $(e.target).hasClass('modal-backdrop')) {
                    this.closeModal();
                }
            });
        }

        if (this.config.keyboardNavigation) {
            $(document).on('keydown.youtubeCarousel', (e) => this.handleKeyboard(e));
        }

        if (this.modal) {
            $(this.modal).on('keydown', (e) => this.handleModalKeyboard(e));
        }
    }

    /**
     * Obsługa klawiatury w modal
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
        }
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

        if (this.modalTitle) {
            this.modalTitle.textContent = video.title;
        }

        let videoUrl = '';
        if (video.type === 'vimeo' && video.vimeo_id) {
            videoUrl = `https://player.vimeo.com/video/${video.vimeo_id}`;
        } else if (video.type === 'youtube' && video.youtube_id) {
            const params = new URLSearchParams({
                rel: '0',           // Tylko powiązane z tego kanału
                modestbranding: '1', // Bez logo YouTube
                showinfo: '0',      // Bez info (dla starszych wersji)
                controls: '1',      // Z kontrolkami
                fs: '1'            // Z opcją pełnego ekranu
            });
            videoUrl = `https://www.youtube.com/embed/${video.youtube_id}?${params.toString()}`;
        }
        this.modalVideo.src = videoUrl;
        $(this.modal).addClass('active');
        $('body').css('overflow', 'hidden');

        this.updateThumbnails();
        this.updateModalNavigation();

        if (this.modalClose) {
            setTimeout(() => {
                this.modalClose.focus();
            }, 100);
        }

        this.trackVideoView(video);
    }

    closeModal() {
        if (!this.modal) {
            return;
        }

        $(this.modal).removeClass('active');

        if (this.modalVideo) {
            this.modalVideo.src = '';
        }

        $('body').css('overflow', 'auto');

        const clickedSlide = this.slides[this.currentVideo];
        if (clickedSlide) {
            clickedSlide.focus();
        }
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
            let videoUrl = '';
            if (video.type === 'vimeo' && video.vimeo_id) {
                videoUrl = `https://player.vimeo.com/video/${video.vimeo_id}`;
            } else if (video.type === 'youtube' && video.youtube_id) {
                const params = new URLSearchParams({
                    autoplay: this.config.autoplay ? '1' : '0',
                    rel: this.config.showRelated ? '1' : '0',
                    modestbranding: '1',
                    iv_load_policy: '3'
                });
                videoUrl = `https://www.youtube.com/embed/${video.youtube_id}?${params.toString()}`;
            }
            this.modalVideo.src = videoUrl;
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
        const provider = video.type === 'vimeo' ? 'vimeo' : 'youtube';
        const videoId = video.type === 'vimeo' ? video.vimeo_id : video.youtube_id;

        if (typeof gtag !== 'undefined') {
            gtag('event', 'video_play', {
                video_title: video.title,
                video_id: videoId,
                video_provider: provider
            });
        }

        if (typeof ga !== 'undefined') {
            ga('send', 'event', 'Video', 'Play', video.title);
        }

        if (typeof fbq !== 'undefined') {
            const category = provider === 'vimeo' ? 'Vimeo_Video' : 'YouTube_Video';
            fbq('trackCustom', 'MovieView', {
                content_category: category,
                content_type: provider + '_video',
                content_name: video.title,
                timestamp: new Date().toISOString()
            });
        }
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
    }
}

/**
 * Initialize play buttons for opinions carousel
 */
function initializeOpinionsMixPlayButtons(carousel, modal) {
    const playButtons = carousel.querySelectorAll('.play-button');

    const modalVideo = document.getElementById('modalVideo');
    const modalTitle = document.getElementById('modalTitle');
    const modalClose = document.getElementById('modalClose');
    const modalPrev = document.getElementById('modalPrev');
    const modalNext = document.getElementById('modalNext');
    const thumbnailsContainer = document.getElementById('thumbnailsContainer');

    // Collect all video slides from the carousel
    const videoSlides = Array.from(carousel.querySelectorAll('.youtube-slide'));

    if (videoSlides.length === 0) return;

    // Create videos array from slides
    const videos = videoSlides.map((slide, index) => {
        const youtubeId = slide.dataset.videoId;
        const vimeoId = slide.dataset.vimeoId;
        const isVimeo = vimeoId && !youtubeId;
        const isYoutube = youtubeId && !vimeoId;

        return {
            id: slide.dataset.index || index,
            title: slide.dataset.title || `Video ${index + 1}`,
            youtube_id: youtubeId,
            vimeo_id: vimeoId,
            type: isVimeo ? 'vimeo' : isYoutube ? 'youtube' : 'unknown',
            thumbnail: youtubeId ? `https://img.youtube.com/vi/${youtubeId}/hqdefault.jpg` : '',
            thumbnailHQ: youtubeId ? `https://img.youtube.com/vi/${youtubeId}/maxresdefault.jpg` : ''
        };
    });

    let currentVideo = 0;

    // Bind play button clicks
    playButtons.forEach((button) => {
        let lastTouchTime = 0;

        // Handle touch events - using vanilla addEventListener
        button.addEventListener('touchend', function(e) {
            lastTouchTime = Date.now();
            e.preventDefault();
            e.stopPropagation();

            const slide = button.closest('.youtube-slide');
            if (slide) {
                const index = videoSlides.indexOf(slide);
                if (index !== -1) {
                    openOpinionVideoModal(index);
                }
            }
        });

        // Handle click events - using vanilla addEventListener (ignore emulated ones from touch)
        button.addEventListener('click', function(e) {
            // Ignore emulated click if touchend fired recently
            if (Date.now() - lastTouchTime < 300) {
                return;
            }
            e.preventDefault();
            e.stopPropagation();

            const slide = button.closest('.youtube-slide');
            if (slide) {
                const index = videoSlides.indexOf(slide);
                if (index !== -1) {
                    openOpinionVideoModal(index);
                }
            }
        });
    });

    function openOpinionVideoModal(index) {
        if (index < 0 || index >= videos.length) return;

        currentVideo = index;
        const video = videos[index];

        // Set modal title
        if (modalTitle) {
            modalTitle.textContent = video.title;
        }

        // Set video source with appropriate parameters
        if (modalVideo) {
            let videoUrl = '';
            if (video.type === 'vimeo' && video.vimeo_id) {
                videoUrl = `https://player.vimeo.com/video/${video.vimeo_id}`;
            } else if (video.type === 'youtube' && video.youtube_id) {
                const params = new URLSearchParams({
                    rel: '0',
                    modestbranding: '1',
                    showinfo: '0',
                    controls: '1',
                    fs: '1'
                });
                videoUrl = `https://www.youtube.com/embed/${video.youtube_id}?${params.toString()}`;
            }
            modalVideo.src = videoUrl;
        }

        // Show modal
        $(modal).addClass('active');
        $('body').css('overflow', 'hidden');

        // Update navigation buttons
        updateNavigation();

        // Update thumbnails
        updateThumbnails();

        // Focus close button
        if (modalClose) {
            setTimeout(() => {
                modalClose.focus();
            }, 100);
        }

        // Track video view
        trackVideoView(video);
    }

    function updateNavigation() {
        if (modalPrev) {
            modalPrev.disabled = currentVideo <= 0;
            $(modalPrev).css('opacity', currentVideo <= 0 ? '0.3' : '1');
        }

        if (modalNext) {
            modalNext.disabled = currentVideo >= videos.length - 1;
            $(modalNext).css('opacity', currentVideo >= videos.length - 1 ? '0.3' : '1');
        }
    }

    function updateThumbnails() {
        if (!thumbnailsContainer) return;

        const thumbnails = thumbnailsContainer.querySelectorAll('.thumbnail-item');
        thumbnails.forEach((thumb, index) => {
            $(thumb).toggleClass('active', index === currentVideo);
        });

        const activeThumb = thumbnails[currentVideo];
        if (activeThumb) {
            activeThumb.scrollIntoView({
                behavior: 'smooth',
                block: 'nearest',
                inline: 'center'
            });
        }
    }

    function trackVideoView(video) {
        const provider = video.type === 'vimeo' ? 'vimeo' : 'youtube';
        const videoId = video.type === 'vimeo' ? video.vimeo_id : video.youtube_id;

        if (typeof gtag !== 'undefined') {
            gtag('event', 'video_play', {
                video_title: video.title,
                video_id: videoId,
                video_provider: provider
            });
        }

        if (typeof ga !== 'undefined') {
            ga('send', 'event', 'Video', 'Play', video.title);
        }

        if (typeof fbq !== 'undefined') {
            const category = provider === 'vimeo' ? 'Vimeo_Video' : 'YouTube_Video';
            fbq('trackCustom', 'MovieView', {
                content_category: category,
                content_type: provider + '_video',
                content_name: video.title,
                timestamp: new Date().toISOString()
            });
        }
    }

    // Modal control handlers
    if (modalClose) {
        $(modalClose).on('click', (e) => {
            e.preventDefault();
            closeOpinionVideoModal();
        });
    }

    if (modalPrev) {
        $(modalPrev).on('click', (e) => {
            e.preventDefault();
            if (currentVideo > 0) {
                switchOpinionVideo(currentVideo - 1);
            }
        });
    }

    if (modalNext) {
        $(modalNext).on('click', (e) => {
            e.preventDefault();
            if (currentVideo < videos.length - 1) {
                switchOpinionVideo(currentVideo + 1);
            }
        });
    }

    // Thumbnail clicks
    if (thumbnailsContainer) {
        $(thumbnailsContainer).on('click', '.thumbnail-item', (e) => {
            e.preventDefault();
            const index = parseInt(e.currentTarget.dataset.index);
            switchOpinionVideo(index);
        });
    }

    // Modal backdrop click
    $(modal).on('click', (e) => {
        if (e.target === modal || $(e.target).hasClass('modal-backdrop')) {
            closeOpinionVideoModal();
        }
    });

    function switchOpinionVideo(index) {
        if (index < 0 || index >= videos.length) return;

        currentVideo = index;
        const video = videos[index];

        if (modalTitle) {
            modalTitle.textContent = video.title;
        }

        if (modalVideo) {
            let videoUrl = '';
            if (video.type === 'vimeo' && video.vimeo_id) {
                videoUrl = `https://player.vimeo.com/video/${video.vimeo_id}`;
            } else if (video.type === 'youtube' && video.youtube_id) {
                const params = new URLSearchParams({
                    autoplay: '1',
                    rel: '0',
                    modestbranding: '1',
                    iv_load_policy: '3'
                });
                videoUrl = `https://www.youtube.com/embed/${video.youtube_id}?${params.toString()}`;
            }
            modalVideo.src = videoUrl;
        }

        updateThumbnails();
        updateNavigation();
        trackVideoView(video);
    }

    function closeOpinionVideoModal() {
        $(modal).removeClass('active');

        if (modalVideo) {
            modalVideo.src = '';
        }

        $('body').css('overflow', 'auto');
    }
}

/**
 * Auto-initialize when DOM is ready
 */
$(document).ready(function() {
    let carouselId = null;
    let carouselElement = document.getElementById('youtubeCarousel');

    if (!carouselElement) {
        carouselElement = document.getElementById('videos');
        if (carouselElement) {
            carouselId = 'videos';
        }
    } else {
        carouselId = 'youtubeCarousel';
    }

    if (carouselElement) {
        const modalElement = document.getElementById('youtubeModal');

        try {
            window.youtubeCarousel = new YouTubeCarousel({
                carouselId: carouselId,
                modalId: 'youtubeModal',
                autoplay: true,
                showRelated: false,
                keyboardNavigation: true
            });
        } catch (error) {
            console.error('Failed to initialize YouTube Carousel:', error);
        }
    }

    // Initialize opinions carousel with play button handlers
    const opinionsMixCarousel = document.getElementById('opinionsmixCarousel');
    if (opinionsMixCarousel) {
        const youtubeModal = document.getElementById('youtubeModal');
        if (youtubeModal) {
            initializeOpinionsMixPlayButtons(opinionsMixCarousel, youtubeModal);
        }
    }

    const videoCarousel = document.getElementById('videos');
    if (videoCarousel) {
        const youtubeModal = document.getElementById('youtubeModal');
        if (youtubeModal) {
            initializeOpinionsMixPlayButtons(videoCarousel, youtubeModal);
        }
    }
});

// Make class available globally
window.YouTubeCarousel = YouTubeCarousel;

// Export for module systems
export default YouTubeCarousel;
