import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
    static values = {
        cardsUrl:   String,
        columnsUrl: String
    }

    connect() {
        this.initCardSort()
        this.initColumnSort()
    }

    disconnect() {
        this.cardSortables?.forEach(s => s.destroy())
        this.columnSortable?.destroy()
    }

    initCardSort() {
        this.cardSortables = Array.from(
            this.element.querySelectorAll("[data-card-list]")
        ).map(list =>
            Sortable.create(list, {
                group:      { name: "cards", pull: true, put: true },
                animation:  150,
                ghostClass: "opacity-50",
                onEnd:      this.onCardEnd.bind(this)
            })
        )
    }

    initColumnSort() {
        this.columnSortable = Sortable.create(this.element, {
            group:      { name: "columns" },
            animation:  150,
            ghostClass: "opacity-50",
            handle:     "[data-column-handle]",
            draggable:  "[data-column-id]",
            onEnd:      this.onColumnEnd.bind(this)
        })
    }

    onCardEnd(event) {
        const id       = event.item.dataset.cardId
        const position = event.newIndex
        const columnId = event.item.parentElement.dataset.cardList
        if (!id) return
        this.patch(this.cardsUrlValue, { id, position, column_id: columnId })
    }

    onColumnEnd(event) {
        const id       = event.item.dataset.columnId
        const position = event.newIndex
        if (!id) return
        this.patch(this.columnsUrlValue, { id, position })
    }

    patch(url, data) {
        fetch(url, {
            method:  "PATCH",
            headers: {
                "Content-Type": "application/json",
                "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]')?.content
            },
            body: JSON.stringify(data)
        })
    }
}