(function() {
  var google = window[window.GoogleAnalyticsObject];

  if (google) {
    $(document).on('pjax:complete', function() {
      google('set', 'location', window.location.href);
      google('send', 'pageview');
    });
  }

  $(document).pjax('a', '#content', {fragment: '#content'});
})();
