import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loading"
export default class extends Controller {
  static targets = ["spinner"]

  connect() {
    this.hide();

    document.addEventListener("turbo:visit", () => {
      this.timer = setTimeout(() => {
        this.show()
      }, 500)
    })

    document.addEventListener("turbo:load", () => {
      clearTimeout(this.timer)
     })
  }

  show(){
    this.spinnerTarget.classList.remove("hidden");

    setTimeout(() => {
      this.hide()
    }, 2000);
  }

  hide(){
    this.spinnerTarget.classList.add("hidden");
  }
}
