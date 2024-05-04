import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = ["prixParJour", "prixTotal", "differenceJours", "dateBooking", "datepickerInput"];

  connect() {
    flatpickr(this.datepickerInputTarget, {
      mode: "range",
      dateFormat: "Y-m-d",
      onClose: this.updateDateFields.bind(this)
    });
  }

  updateDateFields(selectedDates) {

    const prixParJour = parseFloat(this.prixParJourTarget.textContent);

    if (selectedDates.length === 2) {
      console.log((selectedDates[1] - selectedDates[0]) / 86400000)

        const differenceMs = selectedDates[1] - selectedDates[0];
        const differenceJours = differenceMs / (1000 * 3600 * 24);
        const prixTotal = differenceJours * prixParJour;
        this.prixTotalTarget.textContent = prixTotal.toFixed(2) + "$";
        this.differenceJoursTarget.textContent = differenceJours;
      }
  }


}
