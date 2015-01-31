(function() {

  var randomPostsAttr   = 'data-random-posts';

  function mapFn (post) {
    post.publishedHuman = moment(post.published).format("MMM D, YYYY");
    return post;
  }

  window.pageReady(function() {
    $('[' + randomPostsAttr +']').each(function() {

      var $this     = $(this);
      var count     = _.parseInt($this.attr(randomPostsAttr));
      var currentId = $this.attr('data-current-post');
      var template  = $('[data-template-post]').html();

      if (count > 0 && typeof template !== 'undefined') {
        $this.empty();
        $.getJSON('/blog.json', function(data) {
          window.asyncEntryRenderer(data, count, template, mapFn, $this, currentId);
        });
      }

    });
  });

})();
