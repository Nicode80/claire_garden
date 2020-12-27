// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("trix")
require("@rails/actiontext")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { plantCreateSafe, taskCreateSafe } from '../components/create_safe';
import { ajaxBannerFilter, ajaxCalendarFilter, ajaxSeasonFilter } from '../components/ajax_filter';
import { previewImageOnFileSelect } from '../components/photo_preview';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  plantCreateSafe();
  taskCreateSafe();
  ajaxBannerFilter();
  ajaxCalendarFilter();
  ajaxSeasonFilter();
  previewImageOnFileSelect('new-user-photo-input', 'new-user-photo-preview');
  previewImageOnFileSelect('new-plant-photo-input', 'new-plant-photo-preview');
  previewImageOnFileSelect('new-task-photo-input', 'new-task-photo-preview');
  previewImageOnFileSelect('edit-user-photo-input', 'edit-user-photo-preview');
  previewImageOnFileSelect('edit-plant-photo-input', 'edit-plant-photo-preview');
  previewImageOnFileSelect('edit-task-photo-input', 'edit-task-photo-preview');
});
