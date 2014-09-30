(function() {

  window.pageReady(function() {
    var $slideshow = $('[data-slides]');

    $slideshow.slick({
      slide: 'li',
      dots: true,
      speed: 400,
      fade: false,
      arrows: false,
      draggable: true,
      autoplay: false,
      autoplaySpeed: 3000,
    });

  });

})();
