import Rails from '@rails/ujs'

const submitForm = (event) => {
  event.preventDefault();
  const filterForm = document.querySelector('#filter-form');

  Rails.fire(filterForm, 'submit');

}

const ajaxFilter = () => {
  const filterForm = document.querySelector('#filter-form');
  if(!filterForm) return;

  const dropdown = filterForm.querySelector('#plant_type');
  dropdown.addEventListener('change', submitForm );

  const search = filterForm.querySelector('#plant_query');
  search.addEventListener('keyup', submitForm);
}

export { ajaxFilter }
