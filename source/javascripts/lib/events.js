(function() {

  var clickyEvent = function(href, title, type) {
    type = type || 'click';
    if (typeof window.clicky !== "undefined")
      return window.clicky.log(href, title, type);
  };

  window.clickyEvent = clickyEvent;

  function googleEvent (category, action, label) {
    /* ga('send', 'event', 'button', 'click', 'nav buttons'); */
    var ga = window[window.GoogleAnalyticsObject];
    if (typeof ga !== 'undefined') {
      // console.log("--- sending GA event", category, action, label);
      ga('send', 'event', category, action, label);
    }
  }

  window.googleEvent = googleEvent;

})();
