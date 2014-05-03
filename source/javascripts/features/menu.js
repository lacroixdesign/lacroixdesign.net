(function() {
  var ESC_KEY = 27;

  function openMenu() {
    $('body').toggleClass('is-menu-open');
    $(document).on('keydown', closeMenuOnEsc);
  }

  function closeMenu() {
    $('body').toggleClass('is-menu-open');
    $(document).off('keydown', closeMenuOnEsc);
  }

  function closeMenuOnEsc(event) {
    if (event.keyCode === ESC_KEY) {
      event.preventDefault();
      closeMenu(event);
    }
  }

  $(document).on('click', '#menu-open', function(event) {
    event.preventDefault();
    openMenu();
  });
  $(document).on('click', '#menu-close', function(event) {
    event.preventDefault();
    closeMenu();
  });
  $(document).on('click', '#menu a:not("[target]"):not([href^="mailto:"])', closeMenu);
})();
