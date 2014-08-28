$(document).on('pjax:end', function() {
  if (typeof window.twttr !== "undefined")
    window.twttr.widgets.load();
});
