function onLocationHashChange() {
  window.sendPageview();
}

window.onhashchange = onLocationHashChange;
