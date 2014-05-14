(function() {
  var clickyEvent = function(href, title, type) {
    if (typeof window.clicky !== "undefined")
      window.clicky.log(href, title, type);
  };

  window.clickyEvent = clickyEvent;
})();
