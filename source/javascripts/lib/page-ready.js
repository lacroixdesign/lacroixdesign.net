(function() {
  var pageReady = function(func) {
    $(document).ready(func);
    $(document).on('pjax:end', func);
  };

  window.pageReady = pageReady;
})();
