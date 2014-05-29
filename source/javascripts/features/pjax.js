(function() {
  $(document).on('pjax:end', function() {

    var google = window[window.GoogleAnalyticsObject];
    if (google) {
      google('set', 'location', window.location.href);
      google('send', 'pageview');
    }

    if (!!window.clicky) {
      window.clicky.log(
        document.location.pathname + document.location.search,
        document.title,
        'pageview'
      );
    }

  });

  $(document).pjax('a', '#content', {fragment: '#content', timeout: 1500});
})();
