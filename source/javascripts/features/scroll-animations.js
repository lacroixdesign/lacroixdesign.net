/* global WOW */

window.pageReady(function() {

  // WOW.js

  if (Modernizr.cssanimations) {
    new WOW({
      boxClass: 'will-animate',
      mobile: false
    }).init();
  }

  // ScrollMagic + GSAP

  var currentWindowHeight = 0;

  var calcWindowHeight = function() {
    currentWindowHeight = $(window).height();
  };

  $(window).on("resize", calcWindowHeight);
  calcWindowHeight();

  var pauseTweenForShortViewport = function (tween) {
    if (currentWindowHeight < 400) {
      tween.pause();
      tween.time(0);
    } else {
      tween.play();
    }
  };

  var tweenOpts = {
    ease: Linear.easeNone,
    onUpdate: pauseTweenForShortViewport,
    onUpdateParams: ["{self}"]
  };

  var controller = new ScrollMagic.Controller({
    globalSceneOptions: {
      triggerHook: "onEnter",
      duration: "100%"
    }
  });

  // Inline post header

  if ($(".b-post-inline-header").length > 0) {
    new ScrollMagic.Scene()
        .setTween(".b-post-inline-header", _.merge({}, tweenOpts, {
          y: "50%"
        }))
        .addTo(controller);
  }

  if ($(".b-post-header").length > 0) {
    new ScrollMagic.Scene()
        .setTween(".b-post-header", _.merge({}, tweenOpts, {
          y: "10%"
        }))
        .addTo(controller);
  }

  // Cover post header

  if ($(".b-post-cover-header").length > 0) {
    new ScrollMagic.Scene()
        .setTween(".b-post-cover-header", _.merge({}, tweenOpts, {
          y: "20%"
        }))
        .addTo(controller);
  }

  if ($(".b-post-cover-header__content").length > 0) {
    new ScrollMagic.Scene()
        .setTween(".b-post-cover-header__content", _.merge({}, tweenOpts, {
          y: "-50%"
        }))
        .addTo(controller);
  }

  // Case study header

  if ($(".b-hero-image").length > 0) {
    new ScrollMagic.Scene()
        .setTween(".b-hero-image", _.merge({}, tweenOpts, {
          y: "40%"
        }))
        .addTo(controller);
  }

  if ($(".s-case-study__hero-content").length > 0) {
    new ScrollMagic.Scene()
        .setTween(".s-case-study__hero-content", _.merge({}, tweenOpts, {
          y: "-50%"
        }))
        .addTo(controller);
  }

  // Team member header

  if ($(".b-hero-team-member").length > 0) {
    new ScrollMagic.Scene()
        .setTween(".b-hero-team-member", _.merge({}, tweenOpts, {
          y: "40%"
        }))
        .addTo(controller);
  }

  if ($(".b-hero-team-member .l-constrained-large").length > 0) {
    new ScrollMagic.Scene()
        .setTween(".b-hero-team-member .l-constrained-large", _.merge({}, tweenOpts, {
          y: "-40%"
        }))
        .addTo(controller);
  }

});
