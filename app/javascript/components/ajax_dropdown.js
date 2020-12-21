const ajaxPlantTypeDropdownFilter = () => {
  const form = document.querySelector('#plant-tab-filter-form');
  if(!form) return;

  const input = form.querySelector('#plant_type');

  input.addEventListener('change', event => {
    // Select only plant and task cards links
    const plantCards = document.querySelector('#plant-cards');
    const plants = plantCards.querySelectorAll("a");
    const taskCards = document.querySelector('#task-cards');
    const tasks = taskCards.querySelectorAll("a");

    // reset d-none for all cards
    plants.forEach(plant => {
      plant.classList.remove('d-none');
    });
    tasks.forEach(task => {
      task.classList.remove('d-none');
    });

    if (event.currentTarget.value !== "Tous") {
      plants.forEach(plant => {
        if (event.currentTarget.value !== plant.dataset.plantCategory) {
          plant.classList.add('d-none'); //hide non selected cards
        }
      });
      tasks.forEach(task => {
        if (event.currentTarget.value !== task.dataset.plantCategory) {
          task.classList.add('d-none'); //hide non selected cards
        }
      });
    }
  });
}

const ajaxSeasonDropdownFilter = () => {
  const seasonDropdown = document.querySelector('#season');
  if(!seasonDropdown) return;

  seasonDropdown.addEventListener('change', event => {
    console.log(event.currentTarget.value);
  });

}

export { ajaxPlantTypeDropdownFilter, ajaxSeasonDropdownFilter }
