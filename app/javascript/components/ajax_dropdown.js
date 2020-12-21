const ajaxDropdownPlantCards = () => {
  const form = document.querySelector('#plant-tab-filter-form');
  if(!form) return;

  const input = form.querySelector('#plant_type');

  input.addEventListener('change', event => {
    // Select only plant cards links
    const plantCards = document.querySelector('#plant-cards');
    const plants = plantCards.querySelectorAll("a");

    // reset d-none for all cards
    plants.forEach(plant => {
      plant.classList.remove('d-none');
    });

    if (event.currentTarget.value !== "Tous") {
      plants.forEach(plant => {
        if (event.currentTarget.value !== plant.dataset.plantCategory) {
          plant.classList.add('d-none'); //hide non selected cards
        }
      });
    }
  });
}

export { ajaxDropdownPlantCards }
