function onLocationHashChange() {
  window.sendPageview();
}

window.onhashchange = _.debounce(onLocationHashChange, 2000);
