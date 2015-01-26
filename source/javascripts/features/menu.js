(function() {
  var ESC_KEY = 27;
  var MENU_OPEN_CLASS = 'is-menu-open';

  function openMenu() {
    $('body').addClass(MENU_OPEN_CLASS);
    $(document).on('keydown', closeMenuOnEsc);
    $(document).on('click', closeMenu);
    _.debounce(function() {
      window.clickyEvent(
        document.location.pathname + '#menu-open',
        'Menu - Open'
      );
    }, 300);
  }

  function closeMenu() {
    $('body').removeClass(MENU_OPEN_CLASS);
    $(document).off('keydown', closeMenuOnEsc);
    $(document).off('click', closeMenu);
    _.debounce(function() {
      window.clickyEvent(
        document.location.pathname + '#menu-close',
        'Menu - Close'
      );
    }, 300);
  }

  function closeMenuOnEsc(event) {
    if (event.keyCode === ESC_KEY) {
      event.preventDefault();
      closeMenu(event);
    }
  }

  function toggleMenu() {
    var isOpen = $('body').hasClass(MENU_OPEN_CLASS);
    if (isOpen)
      return closeMenu();
    openMenu();
  }

  $(document).on('click', '[data-toggle-nav]', function(event) {
    event.stopPropagation();
    event.preventDefault();
    // openMenu();
    toggleMenu();
  });

  $(document).on('click', '#menu a:not("[target]"):not([href^="mailto:"])', function(event) {
    event.stopPropagation();
    closeMenu();
  });

  $(document).on('click', '#menu', function(event) {
    event.stopPropagation();
  });

})();
