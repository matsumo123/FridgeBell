import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="counter"
export default class extends Controller {
  static targets = ["output"]

  connect() {
  }

  initialize(){
    this.countValue = 0;
    this.outputTarget.value = this.countValue;
  }

  addition(){
    if (this.countValue < 99){
      this.countValue++;
      this.outputTarget.value = this.countValue;
      this.outputTarget.dispatchEvent(new Event("input", { bubbles: true }));
    }
  }

  subtraction(){
    if (this.countValue > 0){
      this.countValue--;
      this.outputTarget.value = this.countValue;
      this.outputTarget.dispatchEvent(new Event("input", { bubbles: true }));
    }
  }
}
