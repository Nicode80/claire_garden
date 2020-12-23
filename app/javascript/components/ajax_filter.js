import Rails from '@rails/ujs'

const submitForm = (event) => {
  // event.preventDefault();
  const filterForm = document.querySelector('#filter-form');

  Rails.fire(filterForm, 'submit'); //submit a form ajax way
}

const ajaxFilter = () => {
  const filterForm = document.querySelector('#filter-form');
  if(!filterForm) return;
  // Ajax Dropdown
  const dropdown = filterForm.querySelector('#plant_type');
  dropdown.addEventListener('change', submitForm);
  console.log("dropdown");
  // Ajax search
  const search = filterForm.querySelector('#plant_query');
  search.addEventListener('keyup', submitForm);
  console.log("search");
  // Ajax month filter
  const monthFilterForm = document.querySelector('#month-filter-form');
  const monthInputs = monthFilterForm.querySelectorAll('input');
  monthInputs.forEach(monthInput => {
    monthInput.addEventListener('click', event =>{
      // event.preventDefault();

      Rails.fire(monthFilterForm, 'submit');
      console.log("months");
    });
  });
}

export { ajaxFilter }
