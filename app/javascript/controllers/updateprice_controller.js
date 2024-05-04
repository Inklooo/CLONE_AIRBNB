import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="updateprice"
export default class extends Controller {

  static targets = ["prixParJour", "prixTotal", "differenceJours", "dateBooking"];

  connect() {
  }

  calculatePrice() {
    console.log(this.dateBookingTarget.value)
    const dateDebut = new Date(this.dateDebutTarget.value);
    const dateFin = new Date(this.dateFinTarget.value);



  }
}
