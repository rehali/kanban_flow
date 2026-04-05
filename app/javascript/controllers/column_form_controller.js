import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["display", "form", "input", "error"]

// card_form_controller.js
  showForm() {
    this.element.closest("[data-card-id]").dataset.turboPermanent = true
    this.linkTarget.hidden = true
    this.formTarget.hidden = false
    this.inputTarget.focus()
  }

  hideForm() {
    delete this.element.closest("[data-card-id]").dataset.turboPermanent
    this.formTarget.querySelector("form")?.reset()
    this.linkTarget.hidden = false
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