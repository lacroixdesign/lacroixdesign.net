(function() {

  function render (entriesJson, limit, template, mapFn, $el, currentId) {
    var isLoadedClass = 'is--loaded';

    var id = _.isString(currentId) ? currentId : null;

    var filtered = _.chain(entriesJson)
        .reject({ 'id': id })
        .sample(limit)
        .map(mapFn)
        .value();

    var tmpl = Hogan.compile(template);
    var html = tmpl.render({ posts: filtered });
    $el.append(html);

    $el.addClass(isLoadedClass);
  }

  window.asyncEntryRenderer = render;

})();
