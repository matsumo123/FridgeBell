import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="foods-modal"
export default class extends Controller {
  static targets = [ "foodModal" ]

  connect() {
  }

  closeFood(event){
    if(event.detail.success){
      this.foodModalTarget.classList.add("hidden")
    }
  }

  closeFoodModal(){
    this.foodModalTarget.classList.add("hidden")
  }
}
