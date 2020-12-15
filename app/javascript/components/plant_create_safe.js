const plantCreateSafe = () => {
  const form = document.getElementById('new_plant');
  if(!form) return;

  const name = form.querySelector('#plant_name');
  const btn = form.querySelector('#new-plant-submit');
  btn.disabled = true;

  name.addEventListener('input', evt => {
    const value = evt.currentTarget.value.trim();
    if (value) {
      btn.classList.remove('disabled');
      btn.disabled = false;
    } else {
      btn.classList.add('disabled');
      btn.disabled = true;
    };
})

}


export { plantCreateSafe };
