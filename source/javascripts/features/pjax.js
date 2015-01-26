(function() {
  $(document).on('pjax:end', function() {
    window.sendPageview();
  });

  $(document).pjax('a', '#content', {fragment: '#content', timeout: 1500});
})();
