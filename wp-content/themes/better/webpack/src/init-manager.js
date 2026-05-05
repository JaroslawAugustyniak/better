// init-manager.js
import $ from 'jquery';

class InitializationManager {
    constructor() {
        this.waypointsInitialized = false;
        this.waypointInstances = [];
        this.headerWaypointInstances = [];
        this.checkInterval = null;
        this.maxAttempts = 50;
        this.attempts = 0;
        this.currentHeaderClass = '';
        this.header = null;
        this.lazyLoadObserver = null;
        this.select2Initialized = false;
        this.scrollInitialized = false;
    }
    
    init() {
        console.log('InitManager: Starting...');
        
        // Pobierz header
        this.header = document.querySelector('.page-header');
        if (!this.header) {
            console.warn('InitManager: Header .page-header not found');
        }
        
        // Inicjalizuj od razu (nie zależą od sliderów)
        this.initializeLazyLoad();
        this.initializeSelect2();
        // this.initializeScrollHandling();
        
        this.waitForSlidersAndInit();
    }
    
    waitForSlidersAndInit() {
        this.checkInterval = setInterval(() => {
            this.attempts++;
            
            const mainSliderExists = document.getElementById('mainSlider');
            const youtubeSliderExists = document.getElementById('youtubeCarousel');
            const commentsSliderExists = document.getElementById('commentsCarousel');
            
            const mainReady = !mainSliderExists || (window.sliderCarousel?.isInitialized === true);
            const youtubeReady = !youtubeSliderExists || (window.youtubeCarousel?.isInitialized === true);
            const commentsReady = !commentsSliderExists || (window.commentsCarousel?.isInitialized === true);
            
            const allReady = mainReady && youtubeReady && commentsReady;
            
            if (allReady) {
                clearInterval(this.checkInterval);
                console.log('InitManager: All sliders ready, waiting 800ms for layout...');
                
                setTimeout(() => {
                    this.initializeWaypoints();
                    this.initializeHeaderWaypoints();

                    this.initializeScrollHandling();
                    
                    // Po inicjalizacji wszystkiego, obsłuż początkowy hash
                    this.handleInitialHash();
                }, 800);
            } else if (this.attempts >= this.maxAttempts) {
                clearInterval(this.checkInterval);
                console.warn('InitManager: Timeout, initializing waypoints anyway');
                this.initializeWaypoints();
                this.initializeHeaderWaypoints();
                this.handleInitialHash();
            }
        }, 200);
    }
    
    /**
     * Inicjalizacja obsługi scrollowania
     */
    initializeScrollHandling() {
        if (this.scrollInitialized) {
            console.log('InitManager: Scroll handling already initialized');
            return;
        }
        
        console.log('InitManager: Initializing scroll handling...');
        
        // 1. Obsługa hashchange
        window.addEventListener('hashchange', (event) => {
            event.preventDefault();
            event.stopPropagation();
            this.scrollToHash(window.location.hash);
        }, true);
        
        // 2. Obsługa kliknięć w linki z hash
        document.addEventListener('click', (event) => {
            const target = event.target.closest('a[href*="#"]');
            if (target && !target.hasAttribute('data-no-scroll')) {
                event.preventDefault();
                event.stopPropagation();
                
                const href = target.getAttribute('href');
                
                // Jeśli to link zewnętrzny z hashem, nie obsługuj
                if (href.includes('://') && !href.includes(window.location.hostname)) {
                    return;
                }
                
                const hash = href.startsWith('#') ? href : '#' + href.split('#')[1];
                
                // Zamknij menu mobilne jeśli otwarte
                this.closeMobileMenu();
                
                // Ustaw hash w URL
                if (window.location.hash !== hash) {
                    window.history.replaceState(null, null, hash);
                }
                
                // Scrolluj
                this.scrollToHash(hash);
            }
        }, true);
        
        // 3. Obsługa scroll-to-element (jeśli istnieje)
        const scrollElement = document.getElementById('scroll-to-element');
        if (scrollElement) {
            const linkHash = scrollElement.textContent.trim();
            if (linkHash) {
                window.scrollTo({ top: 0, behavior: 'instant' });
                setTimeout(() => {
                    this.scrollToHash(linkHash);
                }, 100);
            }
        }
        
        this.scrollInitialized = true;
        console.log('InitManager: Scroll handling initialized');
    }
    
    /**
     * Obsłuż początkowy hash po załadowaniu strony
     */
    handleInitialHash() {
        const hash = window.location.hash;
        if (hash && hash.length > 1) {
            console.log('InitManager: Handling initial hash:', hash);
            setTimeout(() => {
                this.scrollToHash(hash);
            }, 300);
        }
    }
    
    /**
     * Scrolluj do elementu na podstawie hash
     */
    scrollToHash(hash) {
        if (!hash || hash.length <= 1) {
            return;
        }
        
        // Usuń # z początku
        const elementId = hash.startsWith('#') ? hash.substring(1) : hash;
        
        // Znajdź element
        let targetElement = document.getElementById(elementId);
        if (!targetElement) {
            targetElement = document.querySelector(`[name="${elementId}"]`);
        }
        
        if (!targetElement) {
            console.warn('InitManager: Target element not found:', elementId);
            return;
        }
        
        // Oblicz pozycję
        const elementTop = this.getElementTopPosition(targetElement);
        const headerOffset = 80; // Offset dla fixed header
        const scrollPosition = Math.max(0, elementTop - headerOffset);
        
        console.log('InitManager: Scrolling to:', elementId, 'at position:', scrollPosition);
        
        // Scrolluj
        window.scrollTo({
            top: scrollPosition,
            behavior: 'smooth'
        });
    }
    
    /**
     * Oblicz pozycję elementu względem dokumentu
     */
    getElementTopPosition(element) {
        const rect = element.getBoundingClientRect();
        const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
        return rect.top + scrollTop;
    }
    
    /**
     * Zamknij menu mobilne
     */
    closeMobileMenu() {
        $('.menu-module').removeClass('menu-module--open');
        $('.menu-button').removeClass('open');
        $('.navbar-collapse').removeClass('in');
    }
    
    /**
     * Inicjalizacja Select2
     */
    initializeSelect2() {
        console.log('InitManager: Initializing Select2...');
        
        if (typeof $.fn.select2 === 'undefined') {
            console.warn('InitManager: Select2 library not loaded');
            return;
        }
        
        const $selects = $('select.select2, select[data-select2], select.custom-select');
        
        if ($selects.length === 0) {
            console.log('InitManager: No Select2 elements found');
            return;
        }
        
        console.log(`InitManager: Found ${$selects.length} Select2 elements`);
        
        $selects.each((index, select) => {
            const $select = $(select);
            var options = this.getSelect2Options($select);
            
            var theme = 'default';

            if ($select.parents('[class*="colorset"]').length > 0) {
                theme = $select.parents('[class*="colorset"]').attr("class").match(/colorset[\w-]*\b/);
            }

            options ={
                minimumResultsForSearch: -1,
                theme: theme,
                width: '100%'
            };

            try {
                $select.select2(options);
            } catch (error) {
                console.error('InitManager: Failed to initialize Select2:', error);
            }
        });
        
        this.select2Initialized = true;
        console.log('InitManager: Select2 initialization complete');
    }
    
    getSelect2Options($select) {
        const defaultOptions = {
            width: '100%',
            theme: 'default',
            language: 'pl'
        };
        
        const customOptions = {};
        
        if ($select.data('placeholder')) {
            customOptions.placeholder = $select.data('placeholder');
            customOptions.allowClear = true;
        }
        
        if ($select.data('allow-clear') !== undefined) {
            customOptions.allowClear = $select.data('allow-clear');
        }
        
        if ($select.data('minimum-input-length') !== undefined) {
            customOptions.minimumInputLength = $select.data('minimum-input-length');
        }
        
        if ($select.data('maximum-selection-length') !== undefined) {
            customOptions.maximumSelectionLength = $select.data('maximum-selection-length');
        }
        
        if ($select.data('tags') !== undefined) {
            customOptions.tags = $select.data('tags');
        }
        
        if ($select.data('ajax-url')) {
            customOptions.ajax = {
                url: $select.data('ajax-url'),
                dataType: 'json',
                delay: 250,
                processResults: function(data) {
                    return { results: data };
                },
                cache: true
            };
        }
        
        return { ...defaultOptions, ...customOptions };
    }
    
    /**
     * Inicjalizacja lazy loadingu obrazków
     */
    initializeLazyLoad() {
        console.log('InitManager: Initializing lazy load...');
        
        if (!('IntersectionObserver' in window)) {
            console.warn('InitManager: IntersectionObserver not supported');
            this.loadAllImagesImmediately();
            return;
        }
        
        const observerOptions = {
            root: null,
            rootMargin: '50px',
            threshold: 0.01
        };
        
        this.lazyLoadObserver = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const img = entry.target;
                    this.loadImage(img);
                    observer.unobserve(img);
                }
            });
        }, observerOptions);
        
        const lazyImages = document.querySelectorAll('img.lazyload[data-src]');
        
        if (lazyImages.length === 0) {
            console.log('InitManager: No lazy load images found');
            return;
        }
        
        console.log(`InitManager: Found ${lazyImages.length} lazy load images`);
        
        lazyImages.forEach(img => {
            this.lazyLoadObserver.observe(img);
        });
    }
    
    loadImage(img) {
        const dataSrc = img.getAttribute('data-src');
        
        if (!dataSrc) {
            console.warn('InitManager: Image has no data-src', img);
            return;
        }
        
        img.classList.add('lazyloading');
        
        const tempImg = new Image();
        
        tempImg.onload = () => {
            img.src = dataSrc;
            img.removeAttribute('data-src');
            img.classList.remove('lazyload', 'lazyloading');
            img.classList.add('lazyloaded');
            
            if (this.waypointsInitialized && typeof Waypoint !== 'undefined') {
                Waypoint.refreshAll();
            }
        };
        
        tempImg.onerror = () => {
            console.error('InitManager: Failed to load image:', dataSrc);
            img.classList.remove('lazyload', 'lazyloading');
            img.classList.add('lazyerror');
        };
        
        tempImg.src = dataSrc;
    }
    
    loadAllImagesImmediately() {
        const lazyImages = document.querySelectorAll('img.lazyload[data-src]');
        
        lazyImages.forEach(img => {
            const dataSrc = img.getAttribute('data-src');
            if (dataSrc) {
                img.src = dataSrc;
                img.removeAttribute('data-src');
                img.classList.remove('lazyload');
                img.classList.add('lazyloaded');
            }
        });
        
        console.log(`InitManager: Loaded ${lazyImages.length} images immediately`);
    }
    
    initializeWaypoints() {
        if (this.waypointsInitialized) return;
        
        console.log('InitManager: Initializing animation waypoints...');
        
        if (typeof Waypoint === 'undefined') {
            console.error('InitManager: Waypoint library not loaded!');
            return;
        }
        
        Waypoint.refreshAll();
        
        const elements = document.querySelectorAll('[data-waypoint-animate]');
        
        if (elements.length === 0) {
            console.log('InitManager: No animation waypoint elements found');
            this.waypointsInitialized = true;
            return;
        }
        
        console.log(`InitManager: Found ${elements.length} animation waypoint elements`);
        
        this.animateVisibleElements(elements);
        
        elements.forEach((element) => {
            if (!element) return;
            
            const waypoint = new Waypoint({
                element: element,
                handler: function(direction) {
                    if (direction === 'down') {
                        element.classList.add('animate');
                    }

                    if (direction === 'up') {
                        element.classList.remove('animate');
                    }
                },
                offset: '85%'
            });
            
            this.waypointInstances.push(waypoint);
        });
        
        this.waypointsInitialized = true;
        console.log(`InitManager: Created ${this.waypointInstances.length} waypoint instances`);
    }
    
    initializeHeaderWaypoints() {
        if (!this.header) {
            console.log('InitManager: No header element, skipping header waypoints');
            return;
        }
        
        console.log('InitManager: Initializing header waypoints...');
        
        const sections = document.querySelectorAll('[data-waypoint-header]');
        
        if (sections.length === 0) {
            console.log('InitManager: No sections with data-waypoint-header found');
            return;
        }
        
        console.log(`InitManager: Found ${sections.length} sections with header waypoints`);
        
        this.checkInitialHeaderState(sections);
        
        sections.forEach((section) => {
            if (!section) return;
            
            const headerClass = section.getAttribute('data-waypoint-header');
            
            if (!headerClass) {
                console.warn('InitManager: Section has empty data-waypoint-header', section);
                return;
            }
            
            const waypointTop = new Waypoint({
                element: section,
                handler: (direction) => {
                    if (direction === 'down') {
                        this.setHeaderClass(headerClass);
                    }
                },
                offset: '20%'
            });
            
            const waypointBottom = new Waypoint({
                element: section,
                handler: (direction) => {
                    if (direction === 'up') {
                        const prevSection = this.findPreviousSection(section, sections);
                        if (prevSection) {
                            const prevClass = prevSection.getAttribute('data-waypoint-header');
                            this.setHeaderClass(prevClass);
                        } else {
                            this.removeHeaderClass();
                        }
                    }
                },
                offset: '20%'
            });
            
            this.headerWaypointInstances.push(waypointTop, waypointBottom);
        });
        
        console.log(`InitManager: Created ${this.headerWaypointInstances.length} header waypoint instances`);
    }
    
    findPreviousSection(currentSection, allSections) {
        const currentIndex = Array.from(allSections).indexOf(currentSection);
        return currentIndex > 0 ? allSections[currentIndex - 1] : null;
    }
    
    checkInitialHeaderState(sections) {
        const windowTop = window.pageYOffset || document.documentElement.scrollTop;
        const windowHeight = window.innerHeight;
        const triggerPoint = windowTop + (windowHeight * 0.2);
        
        let currentSection = null;
        
        sections.forEach((section) => {
            if (!section) return;
            
            const rect = section.getBoundingClientRect();
            const sectionTop = rect.top + windowTop;
            const sectionBottom = sectionTop + rect.height;
            
            if (triggerPoint >= sectionTop && triggerPoint <= sectionBottom) {
                currentSection = section;
            }
        });
        
        if (currentSection) {
            const headerClass = currentSection.getAttribute('data-waypoint-header');
            this.setHeaderClass(headerClass);
        }
    }
    
    setHeaderClass(newClass) {
        if (!this.header || !newClass) return;
        
        if (this.currentHeaderClass) {
            this.header.classList.remove(this.currentHeaderClass);
        }
        
        this.header.classList.add(newClass);
        this.currentHeaderClass = newClass;
    }
    
    removeHeaderClass() {
        if (!this.header) return;
        
        if (this.currentHeaderClass) {
            this.header.classList.remove(this.currentHeaderClass);
            this.currentHeaderClass = '';
        }
    }
    
    animateVisibleElements(elements) {
        const windowTop = window.pageYOffset || document.documentElement.scrollTop;
        const windowHeight = window.innerHeight;
        const triggerPoint = windowTop + (windowHeight * 0.85);
        
        let count = 0;
        
        elements.forEach((element) => {
            if (!element) return;
            
            const rect = element.getBoundingClientRect();
            const elementTop = rect.top + windowTop;
            
            if (elementTop <= triggerPoint && !element.classList.contains('animate')) {
                element.classList.add('animate');
                count++;
            }
        });
        
        console.log(`InitManager: Animated ${count} initially visible elements`);
    }
    
    refresh() {
        if (typeof Waypoint !== 'undefined') {
            Waypoint.refreshAll();
            
            const elements = document.querySelectorAll('[data-waypoint-animate]');
            if (elements.length > 0) {
                this.animateVisibleElements(elements);
            }
            
            const sections = document.querySelectorAll('[data-waypoint-header]');
            if (sections.length > 0) {
                this.checkInitialHeaderState(sections);
            }
        }
    }
    
    destroy() {
        this.waypointInstances.forEach(waypoint => waypoint.destroy());
        this.headerWaypointInstances.forEach(waypoint => waypoint.destroy());
        
        if (this.lazyLoadObserver) {
            this.lazyLoadObserver.disconnect();
            this.lazyLoadObserver = null;
        }
        
        if (this.select2Initialized) {
            $('select.select2, select[data-select2]').select2('destroy');
        }
        
        this.waypointInstances = [];
        this.headerWaypointInstances = [];
        this.waypointsInitialized = false;
        this.select2Initialized = false;
        this.scrollInitialized = false;
        
        this.removeHeaderClass();
        
        console.log('InitManager: All features destroyed');
    }
}

export default InitializationManager;