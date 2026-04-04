// app/javascript/controllers/accordion_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["panel", "trigger", "content", "icon"]
    static values  = { multiple: Boolean }

    toggle(event) {
        const trigger = event.currentTarget
        const panel   = trigger.closest("[data-accordion-target='panel']")
        const content = panel.querySelector("[data-accordion-target='content']")
        const icon    = panel.querySelector("[data-accordion-target='icon']")
        const isOpen  = !content.hidden

        if (!this.multipleValue) this.closeAll()

        content.hidden = isOpen
        trigger.setAttribute("aria-expanded", (!isOpen).toString())
        icon.style.transform = isOpen ? "" : "rotate(180deg)"
    }

    closeAll() {
        this.panelTargets.forEach(panel => {
            panel.querySelector("[data-accordion-target='content']").hidden = true
            panel.querySelector("[data-accordion-target='trigger']")
                .setAttribute("aria-expanded", "false")
            panel.querySelector("[data-accordion-target='icon']").style.transform = ""
        })
    }
}