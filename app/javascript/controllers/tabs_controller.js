// app/javascript/controllers/tabs_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["trigger", "panel"]

    select(event) {
        const index = parseInt(event.currentTarget.dataset.index)
        this.triggerTargets.forEach((trigger, i) => {
            const isSelected = i === index
            trigger.setAttribute("aria-selected", isSelected.toString())
            trigger.classList.toggle("border-primary",    isSelected)
            trigger.classList.toggle("text-primary",       isSelected)
            trigger.classList.toggle("border-transparent", !isSelected)
            trigger.classList.toggle("text-text-muted",    !isSelected)
        })
        this.panelTargets.forEach((panel, i) => { panel.hidden = i !== index })
    }
}