import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reminder-modal"
export default class extends Controller {
  static targets = ["reminderModal"]

  connect() {
  }

  close(event){
    if(event.detail.success){
      this.reminderModalTarget.classList.add("hidden");
    }
  }

  closeModal(){
    this.reminderModalTarget.classList.add("hidden");
  }
}
