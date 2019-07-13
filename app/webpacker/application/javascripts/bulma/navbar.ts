document.addEventListener('turbolinks:load', () => {
  const $navbarBurgers: Array<HTMLElement> = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

  if ($navbarBurgers.length < 1) {
    return;
  }

  $navbarBurgers.forEach($e => {
    $e.addEventListener('click', () => {
      const target = $e.dataset.target;
      const $target = document.getElementById(target);
      $e.classList.toggle('is-active');
      $target.classList.toggle('is-active');
    });
  });
});
