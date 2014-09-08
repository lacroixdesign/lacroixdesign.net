$(document).on('pjax:end', function() {
  if (typeof Prism !== 'undefined')
    Prism.highlightAll();
});
