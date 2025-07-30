import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-food-modal"
export default class extends Controller {
  static targets = ["userFoodModal"]

  connect() {
  }

  close(event){
    if(event.detail.success){
      this.userFoodModalTarget.classList.add("hidden");
    }
  }

  closeModal(){
    this.userFoodModalTarget.classList.add("hidden");
  }
}
