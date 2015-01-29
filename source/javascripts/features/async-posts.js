(function() {

  var randomPostsAttr   = 'data-random-posts';
  var randomPostsSelect = '[' + randomPostsAttr +']';
  var currentPostAttr   = 'data-current-post';
  var isLoadedClass     = 'is--loaded';

  window.pageReady(function() {

    $(randomPostsSelect).each(function() {
      var $this     = $(this);
      var count     = _.parseInt($this.attr(randomPostsAttr));
      var currentId = $this.attr(currentPostAttr);
      var template  = $('[data-template-post]').html();

      if (count > 0 && typeof template !== 'undefined') {
        $this.empty();
        $.getJSON('/blog.json', function randomPostsCb (data) {

          var filtered = _.chain(data)
              .dropWhile({ 'id': currentId })
              .sample(count)
              .map(function(post) {
                post.publishedHuman = moment(post.published).format("MMM D, YYYY");
                return post;
              })
              .value();

          var tmpl = Hogan.compile(template);
          var html = tmpl.render({ posts: filtered });
          $this.append(html);

          $this.addClass(isLoadedClass);
        });
      }
    });

  });

})();
