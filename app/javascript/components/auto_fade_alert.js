const autoFadeAlert = () => {
  const alert = document.querySelector('.alert');
  if(!alert) return;

  $(".alert").fadeOut(5000);
}

export { autoFadeAlert }
