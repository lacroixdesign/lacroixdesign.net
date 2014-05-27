(function() {

  var init = (function(){function e(e){if(n.getElementsByClassName){return n.getElementsByClassName(e)}else{return n.querySelectorAll("."+e)}}function t(e){e.preventDefault();if(e){i=e.target}else{e=window.event;i=e.srcElement}i=e.target;if(i.tagName!="A")i=i.parentNode;if(typeof i.href!=="undefined"&&i.getAttribute("data-mode")!==null){window._embedTF={url:i.href,mode:parseInt(i.getAttribute("data-mode"),10)};var t=n.createElement("script");t.src="https://s3-eu-west-1.amazonaws.com/share.typeform.com/typeform.js";var r=n.getElementsByTagName("script")[0];r.parentNode.insertBefore(t,r);return false}}var n=document,r=e("typeform-share",n),i;if(!/mobile|tablet/i.test(navigator.userAgent.toLowerCase())&&screen.width>=1024&&screen.height>=768){for(var s=0;s<r.length;s++){if(r[s].getAttribute("data-mode")>0){r[s].onclick=t}}}});

  window.pageReady(function() {
    init();

    $(document).on('click', '[data-faux-progress]', function() {

      var $this = $(this);
      $this
        .addClass('animate-faux-progress')
        .delay(4000)
        .queue(function(next) {
          $this.removeClass('animate-faux-progress');
          next();
        });

      var id = $this.attr('id');
      id = (id) ? '#'+id : '#work-with-us';
      window.clickyEvent(
        document.location.pathname + id,
        'Work With Us'
      );

    });
  });

})();
