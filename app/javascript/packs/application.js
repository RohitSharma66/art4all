// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import AOS from 'aos';
import 'aos/dist/aos.css';

Rails.start()
Turbolinks.start()
ActiveStorage.start()



// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

import { initUpdateNavbarOnScroll } from '../components/navbar';
// import { initClearFields } from '../components/contacts.js'; 
// import { changeBackground } from '../components/banner';

document.addEventListener('turbolinks:load', () => {
  // Call your JS functions here
  AOS.init();
  initUpdateNavbarOnScroll();
  initMapbox();
  initAutocomplete();
  // initClearFields();
});
