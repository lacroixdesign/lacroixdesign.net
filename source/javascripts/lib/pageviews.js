(function() {
  var sendPageview = function() {
    var location = window.location.pathname +
        window.location.hash +
        window.location.search;

    if (typeof window.ga !== "undefined")
      ga('send', 'pageview', location);

    if (typeof window.clicky !== "undefined")
      window.clicky.log(location, null, 'pageview');
  };

  window.sendPageview = sendPageview;
})();
