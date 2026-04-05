// app/javascript/controllers/card_form_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["link", "form", "input", "error"]

    showForm() {
        this.linkTarget.hidden = true
        this.formTarget.hidden = false
        this.inputTarget.focus()
    }

    hideForm() {
        this.formTarget.querySelector("form")?.reset()
        this.linkTarget.hidden = false
        this.formTarget.hidden = true
        this.clearError()
    }

    submit(event) {
        if (this.inputTarget.value.trim() === "") {
            event.preventDefault()
            this.showError("Title can't be blank")
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