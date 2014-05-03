(function() {
  var pageReady = function(func) {
    $(document).ready(func);
    $(document).on('pjax:complete', func);
  };

  window.pageReady = pageReady;
})();
