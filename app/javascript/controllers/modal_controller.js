// app/javascript/controllers/modal_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["panel", "backdrop"]
    static values  = { open: Boolean }

    connect() {
        if (this.openValue) this.open()
        this.boundKeydown = this.handleKeydown.bind(this)
    }

    disconnect() {
        document.removeEventListener("keydown", this.boundKeydown)
    }

    open() {
        this.openValue = true
        document.addEventListener("keydown", this.boundKeydown)
        this.panelTarget.removeAttribute("hidden")
        this.backdropTarget.removeAttribute("hidden")
        this.trapFocus()
    }

    close() {
        this.openValue = false
        document.removeEventListener("keydown", this.boundKeydown)
        this.panelTarget.setAttribute("hidden", "")
        this.backdropTarget.setAttribute("hidden", "")
    }

    handleKeydown(event) {
        if (event.key === "Escape") this.close()
        if (event.key === "Tab")    this.handleTab(event)
    }

    trapFocus() {
        const focusable = this.panelTarget.querySelectorAll(
            'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])'
        )
        if (focusable.length) focusable[0].focus()
        this.firstFocusable = focusable[0]
        this.lastFocusable  = focusable[focusable.length - 1]
    }

    handleTab(event) {
        if (!this.firstFocusable) return
        if (event.shiftKey) {
            if (document.activeElement === this.firstFocusable) {
                event.preventDefault()
                this.lastFocusable.focus()
            }
        } else {
            if (document.activeElement === this.lastFocusable) {
                event.preventDefault()
                this.firstFocusable.focus()
            }
        }
    }
}