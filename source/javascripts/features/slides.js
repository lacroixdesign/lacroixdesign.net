(function() {

  $(document).ready(function() {
    var $slideshow = $('[data-slides]');

    $slideshow.slick({
      slide: 'article',
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
