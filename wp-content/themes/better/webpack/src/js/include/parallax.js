// shim layer with setTimeout fallback
window.requestAnimFrame = (function () {
    return  window.requestAnimationFrame ||
            window.webkitRequestAnimationFrame ||
            window.mozRequestAnimationFrame ||
            window.oRequestAnimationFrame ||
            window.msRequestAnimationFrame ||
            function (callback) {
                window.setTimeout(callback, 1000 / 60);
            };
})();

(function (win, d) {

    var $ = d.querySelector.bind(d);

    //var blob1 = $('#blob-1');

    var items = ['#banners-top .item .banners-top-image'];

    var ticking = false;
    var lastScrollY = win.pageYOffset;

    function onResize() {
        updateElements(win.pageYOffset);
    }

    function onScroll(evt) {

        if (!ticking) {
            ticking = true;
            requestAnimFrame(updateElements);
            lastScrollY = win.pageYOffset;
        }
    }

    function updateElements() {

        var headerHeight = jQuery('#header').outerHeight();
        var speedRatio = 2000; //3000

        var relativeY = (lastScrollY - headerHeight) / speedRatio;


        items.forEach(function (string) {
            if (jQuery(string).length) {
                var itemOffsetTop = jQuery(string).parent().offset().top;
                relativeY = (lastScrollY - itemOffsetTop) / speedRatio;

                jQuery(string).each(function () {
                    prefix(this.style, "Transform", "translate3d(0," + pos(0, 1000, relativeY, 0) + 'px, 0)');
                });
            }
        });

        //prefix(bannersTop.style, "Transform", "translate3d(0," + pos(0, 1000, relativeY, 0) + 'px, 0)');

        ticking = false;
    }

    function pos(base, range, relY, offset) {
        return base + limit(0, 1, relY - offset) * range;
    }

    function prefix(obj, prop, value) {
        var prefs = ['webkit', 'Moz', 'o', 'ms'];
        for (var pref in prefs) {
            obj[prefs[pref] + prop] = value;
        }
    }

    function limit(min, max, value) {
        return Math.max(min, Math.min(max, value));
    }

    (function () {

        updateElements(win.pageYOffset);

//        blob1.classList.add('force-show');
    })();

    win.addEventListener('resize', onResize, false);
    win.addEventListener('scroll', onScroll, false);
    win.addEventListener('touchmove', onScroll, false);

})(window, document);