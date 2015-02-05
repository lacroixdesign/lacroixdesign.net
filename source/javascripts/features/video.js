window.pageReady(function() {

  $("#page-content").fitVids();

  if (Modernizr.video && !isMobile.any) {
    $("#welcome-video").show();
  }

});
