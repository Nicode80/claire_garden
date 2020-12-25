import Rails from '@rails/ujs'

const ajaxBannerFilter = () => {
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
}

const ajaxCalendarFilter = () => {
  const monthFilterForm = document.querySelector('#month-filter-form');
  if(!monthFilterForm) return;

  const calendarMonthInputs = monthFilterForm.querySelectorAll('input[type=checkbox]');

  calendarMonthInputs.forEach(calendarMonthInput => {
    calendarMonthInput.addEventListener('change', event =>{
      event.preventDefault();
      //select hidden month in header filter form
      const headerFilterForm = document.querySelector('#filter-form');
      const filterMonthInput = headerFilterForm.querySelector(`input[value=${event.currentTarget.value}]`);
      filterMonthInput.click();

      Rails.fire(monthFilterForm, 'submit');
    });
  });

}

const ajaxSeasonFilter = () => {
  const seasonFilterForm = document.querySelector('#season-filter-form');
  if(!seasonFilterForm) return;

  const season = seasonFilterForm.querySelector('#season');
  season.addEventListener('change', event => {
    event.preventDefault();

    Rails.fire(seasonFilterForm, 'submit');
  });
}

export { ajaxBannerFilter, ajaxCalendarFilter, ajaxSeasonFilter }
