(function() {
  var ESC_KEY = 27;

  function openMenu(event) {
    event.preventDefault();
    $('body').toggleClass('is-menu-open');
    $(document).on('keydown', closeMenuOnEsc);
  }

  function closeMenu(event) {
    event.preventDefault();
    $('body').toggleClass('is-menu-open');
    $(document).off('keydown', closeMenuOnEsc);
  }

  function closeMenuOnEsc(event) {
    if (event.keyCode === ESC_KEY) {
      event.preventDefault();
      closeMenu(event);
    }
  }

  $(document).on('click', '#menu-open', openMenu);
  $(document).on('click', '#menu-close', closeMenu);
})();
