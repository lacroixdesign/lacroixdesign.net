/* global WOW */

(function() {

  var wow = new WOW({
    boxClass: 'will-animate',
    mobile: false
  });

  window.pageReady(function() {
    if (Modernizr.cssanimations)
      wow.init();
  });

})();
