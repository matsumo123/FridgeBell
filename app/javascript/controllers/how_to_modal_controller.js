import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="how-to-modal"
export default class extends Controller {
  static targets = ["modal"]

  connect() {
  }

  open() {
    this.modalTarget.classList.remove("hidden");
  }

  closeModal() {
    this.modalTarget.classList.add("hidden");
  }
}
