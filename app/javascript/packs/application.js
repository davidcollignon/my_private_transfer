import "bootstrap";
import flatpickr from "flatpickr";
import { tns } from "tiny-slider/src/tiny-slider";
import AddressAutocomplete from 'google-address-autocomplete'


flatpickr("#pick_up_date", {enableTime: true, weekNumbers: true});
flatpickr("#service_pick_up_date", {enableTime: true, weekNumbers: true});
const options = {
  types:['geocode', 'establishment'],
}
new AddressAutocomplete('#departure', options, result => console.log(result))


const slider = tns({
    container: '.my-slider',
    items: 1,
    slideBy: 'page',
    nav: false,
    autoplay: false,
    speed: 400,
    autoplayButtonOutput: false,
    mouseDrag: true,
    lazyload: true,
    controlsContainer: "#customize-controls",
    responsive: {
        100: {
            items: 1,
        },

        768: {
            items: 1,
        }
    }
  });

