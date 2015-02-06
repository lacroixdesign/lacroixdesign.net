/*

# Required Libraries

  - jQuery

# Required Arguments

  - toggle element selector/ID
  - header element selector/ID
  - toggle element's visibility class name

*/

var TOGGLE_SEL    = '#nav-toggle-btn';
var HEADER_SEL    = '#header';
var VISIBLE_CLASS = 'is--visible';

$(function() {

  /*
   * Find elements
   */

  var $toggleEl = $(TOGGLE_SEL);
  var $headerEl = $(HEADER_SEL);
  var $window   = $(window);

  /*
   * Show or hide the toggle button,
   *   depending on the page's scroll position
   */

  function showToggleBtnPerScroll() {
    var navHeight = $headerEl.height() + $headerEl.offset().top;
    var position  = $window.scrollTop();

    if ( position > (navHeight * 2) )
      return $toggleEl.toggleClass(VISIBLE_CLASS, true);
    return $toggleEl.toggleClass(VISIBLE_CLASS, false);
  }

  /*
   * Init
   */

  showToggleBtnPerScroll();

  /*
   * Register events
   */

  $window.scroll(showToggleBtnPerScroll);

});
