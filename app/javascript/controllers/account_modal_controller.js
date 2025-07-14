import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="account-modal"
export default class extends Controller {
  static targets = ["userModal", "passwordModal"]

  connect() {
  }

  closeUser(event){
    if(event.detail.success){
      this.userModalTarget.classList.add("hidden")
      window.location.href = "/users/profile";
    }
  }

  closePassword(event){
    if(event.detail.success){
      this.passwordModalTarget.classList.add("hidden")
      window.location.href = "/users/profile";
    }
  }

  closeUserModal(){
    this.userModalTarget.classList.add("hidden")
  }

  closePasswordModal(){
    this.passwordModalTarget.classList.add("hidden")
  }
}
