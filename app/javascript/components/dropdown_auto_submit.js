const dropdownAutoSubmit = (formId, inputId) => {
  const form = document.querySelector(formId);
  if(!form) return;

  const input = form.querySelector(inputId);
  input.addEventListener('change', event => {
    form.submit();
  });
}

const plantDropdownAutoSubmit = dropdownAutoSubmit('#plant-tab-filter-form', '#plant_type')
const taskDropdownAutoSubmit = dropdownAutoSubmit('#calendar-tab-filter-form', '#plant_type')

export { plantDropdownAutoSubmit, taskDropdownAutoSubmit }
