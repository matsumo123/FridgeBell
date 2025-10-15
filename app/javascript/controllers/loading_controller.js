import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loading"
export default class extends Controller {
  static targets = ["spinner"]

  connect() {
    this.hide();
    this.timer = null
    this.shownAt = 0

    document.addEventListener("turbo:visit", () => {
      clearTimeout(this.timer)
      this.timer = setTimeout(() => {
        this.show()
        this.shownAt = performance.now()
      }, 500)
    })

    document.addEventListener("turbo:load", () => {
      clearTimeout(this.timer)
      if(this.spinnerTarget.classList.contains("hidden")) return
      const elapsed = performance.now() - this.shownAt
      const remain  = Math.max(2000 - elapsed, 0)
      setTimeout(() => this.hide(), remain)
     })
  }

  show(){
    this.spinnerTarget.classList.remove("hidden");
  }

  hide(){
    this.spinnerTarget.classList.add("hidden");
  }
}
