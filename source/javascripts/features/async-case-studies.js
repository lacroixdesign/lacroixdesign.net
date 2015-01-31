(function() {

  var dataAttr = 'data-random-case-studies';

  function mapFn (post) {
    return post;
  }

  window.pageReady(function() {
    $('[' + dataAttr +']').each(function() {

      var $this     = $(this);
      var count     = _.parseInt($this.attr(dataAttr));
      var currentId = $this.attr('data-current-entry');
      var template  = $('[data-template-case-studies]').html();

      if (count > 0 && typeof template !== 'undefined') {
        $this.empty();
        $.getJSON('/case-studies.json', function(data) {
          window.asyncEntryRenderer(data, count, template, mapFn, $this, currentId);
        });
      }

    });
  });

})();
