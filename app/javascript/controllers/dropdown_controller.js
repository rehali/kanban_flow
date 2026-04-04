// app/javascript/controllers/dropdown_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["trigger", "menu"]

    toggle() {
        this.menuTarget.hidden ? this.open() : this.close()
    }

    open() {
        this.menuTarget.removeAttribute("hidden")
        this.triggerTarget.setAttribute("aria-expanded", "true")
        document.addEventListener("keydown",
            this.boundKeydown ||= this.handleKeydown.bind(this))
    }

    close() {
        this.menuTarget.setAttribute("hidden", "")
        this.triggerTarget.setAttribute("aria-expanded", "false")
        document.removeEventListener("keydown", this.boundKeydown)
    }

    closeOnOutsideClick(event) {
        if (!this.element.contains(event.target)) this.close()
    }

    handleKeydown(event) {
        if (event.key === "Escape") { this.close(); this.triggerTarget.focus() }
        if (event.key === "ArrowDown") { event.preventDefault(); this.focusNext() }
        if (event.key === "ArrowUp")   { event.preventDefault(); this.focusPrevious() }
    }

    focusNext() {
        const items = this.menuItems
        const next  = items[items.indexOf(document.activeElement) + 1] || items[0]
        next?.focus()
    }

    focusPrevious() {
        const items = this.menuItems
        const prev  = items[items.indexOf(document.activeElement) - 1] || items[items.length - 1]
        prev?.focus()
    }

    get menuItems() {
        return Array.from(this.menuTarget.querySelectorAll('[role="menuitem"]'))
    }
}