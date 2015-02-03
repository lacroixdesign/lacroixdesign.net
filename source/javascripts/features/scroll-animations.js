/* global WOW */

window.pageReady(function() {
  if (Modernizr.cssanimations) {
    new WOW({
      boxClass: 'will-animate',
      mobile: false
    }).init();
  }
});
