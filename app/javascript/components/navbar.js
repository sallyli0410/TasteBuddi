const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-buddi');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-buddi-white');
      } else {
        navbar.classList.remove('navbar-buddi-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
