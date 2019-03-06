// app/javascript/plugins/init_autocomplete.js
import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('departure');
  if (addressInput) {
    places({ container: addressInput });
  }
  const addressInputService = document.getElementById('service_pick_up_address');
  if (addressInputService) {
    places({ container: addressInputService });
  }
};


export { initAutocomplete };
