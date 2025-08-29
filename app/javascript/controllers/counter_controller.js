import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="counter"
export default class extends Controller {
  static targets = ["output", "unit", "pretend"]

  connect(){
  }

  initialize(){
    this.countValue = 0;
    this.outputTarget.value = this.countValue;
  }

  addition(){
    if (this.countValue < 100){
      const unit = Number(this.unitTarget.value);
      this.countValue += unit;
      this.render();
    }
  }

  subtraction(){
    if (this.countValue > 0){
      const unit = Number(this.unitTarget.value);
      this.countValue -= unit;
      this.render();
    }
  }

  render(){
    this.pretendTarget.textContent = this.countValue;
    this.outputTarget.value = this.countValue;
    this.outputTarget.dispatchEvent(new Event("input", { bubbles: true }));
  }
}
