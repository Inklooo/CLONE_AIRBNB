import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="updateprice"
export default class extends Controller {

  static targets = ["dateDebut", "dateFin", "prixParJour", "prixTotal", "differenceJours"];

  connect() {
  }

  calculatePrice() {
    const dateDebut = new Date(this.dateDebutTarget.value);
    const dateFin = new Date(this.dateFinTarget.value);
    const prixParJour = parseFloat(this.prixParJourTarget.textContent);

    if (!isNaN(dateDebut) && !isNaN(dateFin) && !isNaN(prixParJour)) {
      const differenceMs = dateFin.getTime() - dateDebut.getTime();
      const differenceJours = differenceMs / (1000 * 3600 * 24);
      const prixTotal = differenceJours * prixParJour;
      this.prixTotalTarget.textContent = prixTotal.toFixed(2) + "$";
      this.differenceJoursTarget.textContent = differenceJours;
    } else {
      this.prixTotalTarget.textContent = "0 €";
    }
  }
}
