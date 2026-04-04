// app/javascript/controllers/toast_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static values = { duration: { type: Number, default: 4000 } }

    connect()    { this.scheduleRemoval() }
    disconnect() { clearTimeout(this.removalTimer) }
    dismiss()    { this.remove() }

    scheduleRemoval() {
        if (this.durationValue > 0) {
            this.removalTimer = setTimeout(() => this.remove(), this.durationValue)
        }
    }

    remove() {
        this.element.style.transition = "opacity 200ms ease-out, transform 200ms ease-out"
        this.element.style.opacity    = "0"
        this.element.style.transform  = "translateX(100%)"
        setTimeout(() => this.element.remove(), 200)
    }
}