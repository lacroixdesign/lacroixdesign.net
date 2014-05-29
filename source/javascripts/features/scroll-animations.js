/* global WOW */

(function() {
  window.pageReady(function() {
    if (Modernizr.cssanimations) {
      new WOW({
        boxClass: 'will-animate',
        mobile: false
      }).init();
    }
  });
})();
