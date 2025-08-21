import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="foods-modal"
export default class extends Controller {
  static targets = [ "foodModal" ]

  connect() {
  }

  closeIfSuccess(event){
    if(event.detail?.success) this.closeModal();
  }

  closeModal(){
    this.foodModalTarget.classList.add("hidden");
  }
}
