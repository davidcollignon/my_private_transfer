// app/javascript/plugins/init_autocomplete.js
import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('departure');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
