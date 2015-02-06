(function() {

  /*
   * Load preview
   */

  function loadLivePreview(el) {
    var $this    = $(el);
    var device   = $this.data('show-live-preview');
    var $element = $('[data-live-preview]');
    var current  = $element.attr('data-live-preview');

    $element.find('iframe').each(function() {
      if (!$(this).attr('src')) {
        var src = $(this).attr('data-src');
        $(this).attr('src', src);
      }
    });

    $('[data-show-live-preview]').removeClass('active');
    $this.addClass('active');

    $element
      .attr('data-live-preview', device)
      .each(function() {
        if (device !== current) {
          // Re-trigger the fade animation
          var element = $(this)[0];
          element.classList.remove("run-animation");
          // -> triggering reflow /* The actual magic */
          // without this it wouldn't work. Try uncommenting the line and the transition won't be retriggered.
          element.offsetWidth = element.offsetWidth;
          // -> and re-adding the class
          element.classList.add("run-animation");

          // Send an event to analytics
          var eventLoc  = document.location.pathname + '#live-preview-' + device;
          var eventName = 'Live Preview - ' + device.toUpperCase();
          window.clickyEvent(eventLoc, eventName);
        }
      });
  }

  /*
  * Listeners & events
  */

  $(document).on('click', '[data-show-live-preview]', function(event) {
    event.preventDefault();
    loadLivePreview(this);
  });

  window.pageReady(function() {
    $('[data-show-live-preview]:visible:first-child').each(function() {
      loadLivePreview(this);
    });
  });

})();
