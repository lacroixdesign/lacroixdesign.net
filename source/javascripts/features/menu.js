(function() {
  var ESC_KEY = 27;

  function openMenu() {
    $('body').addClass('is-menu-open');
    $(document).on('keydown', closeMenuOnEsc);
    $(document).on('click', closeMenu);
    window.clickyEvent(
      document.location.pathname + '#menu-open',
      'Menu - Open'
    );
  }

  function closeMenu() {
    $('body').removeClass('is-menu-open');
    $(document).off('keydown', closeMenuOnEsc);
    $(document).off('click', closeMenu);
    window.clickyEvent(
      document.location.pathname + '#menu-close',
      'Menu - Close'
    );
  }

  function closeMenuOnEsc(event) {
    if (event.keyCode === ESC_KEY) {
      event.preventDefault();
      closeMenu(event);
    }
  }

  $(document).on('click', '#menu-open, [data-open-nav]', function(event) {
    event.stopPropagation();
    event.preventDefault();
    openMenu();
  });
  $(document).on('click', '#menu-close', function(event) {
    event.stopPropagation();
    event.preventDefault();
    closeMenu();
  });
  $(document).on('click', '#menu a:not("[target]"):not([href^="mailto:"])', function(event) {
    event.stopPropagation();
    closeMenu();
  });
  $(document).on('click', '#menu', function(event) {
    event.stopPropagation();
  });
})();
