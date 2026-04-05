// app/javascript/controllers/column_form_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["display", "form", "input", "error"]

  showForm() {
    this.displayTarget.hidden = true
    this.formTarget.hidden = false
    this.inputTarget.focus()
  }

  hideForm() {
    this.formTarget.querySelector("form")?.reset()
    this.displayTarget.hidden = false
    this.formTarget.hidden = true
    this.clearError()
  }

  submit(event) {
    if (this.inputTarget.value.trim() === "") {
      event.preventDefault()
      this.showError("Name can't be blank")
    }
  }

  showError(message) {
    this.errorTarget.textContent = message
    this.errorTarget.hidden = false
  }

  clearError() {
    this.errorTarget.textContent = ""
    this.errorTarget.hidden = true
  }
}