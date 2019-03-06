import "bootstrap";
import { initAutocomplete } from '../plugins/init_autocomplete';
import flatpickr from "flatpickr";

flatpickr("#pick_up_date", {enableTime: true, weekNumbers: true});
flatpickr("#service_pick_up_date", {enableTime: true, weekNumbers: true});
initAutocomplete();
