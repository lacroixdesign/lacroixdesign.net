(function() {
  var clickyEvent = function(href, title, type) {
    type = type || 'click';
    if (typeof window.clicky !== "undefined")
      return window.clicky.log(href, title, type);
  };

  window.clickyEvent = clickyEvent;
})();
