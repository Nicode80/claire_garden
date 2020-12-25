import Rails from '@rails/ujs'

const ajaxFilter = () => {
  const filterForm = document.querySelector('#filter-form');
  if(!filterForm) return;

  // Ajax Dropdown
  const dropdown = filterForm.querySelector('#plant_type');
  dropdown.addEventListener('change', event => {
    event.preventDefault();
    //Put dropdown value into hidden field of calendar
    const hiddenPlantType = document.querySelector('#hidden-plant-type');
    hiddenPlantType.value = event.currentTarget.value;

    //submit a form ajax way thanks to Rails.fire
    Rails.fire(filterForm, 'submit');
  });

  // Ajax search
  const search = filterForm.querySelector('#plant_query');
  search.addEventListener('keyup', event => {
    event.preventDefault();
    //Put search value into hidden field of calendar
    const hiddenPlantQuery = document.querySelector('#hidden-plant-query');
    hiddenPlantQuery.value = event.currentTarget.value;

    //submit a form ajax way thanks to Rails.fire
    Rails.fire(filterForm, 'submit');
  });

  // Ajax month filter
  const monthFilterForm = document.querySelector('#month-filter-form');
  const calendarMonthInputs = monthFilterForm.querySelectorAll('input[type=checkbox]');

  calendarMonthInputs.forEach(calendarMonthInput => {
    calendarMonthInput.addEventListener('change', event =>{
      event.preventDefault();
      //select hidden month in header filter form
      const filterMonthInput = filterForm.querySelector(`input[value=${event.currentTarget.value}]`);
      filterMonthInput.click();

      Rails.fire(monthFilterForm, 'submit');
    });
  });
}

export { ajaxFilter }
