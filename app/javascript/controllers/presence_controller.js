// app/javascript/controllers/presence_controller.js
import { Controller } from "@hotwired/stimulus"
import consumer from "channels/consumer"

export default class extends Controller {
    static values  = { boardId: String }
    static targets = ["member"]

    connect() {
        this.subscription = consumer.subscriptions.create(
            { channel: "PresenceChannel", board_id: this.boardIdValue },
            {
                received: (data) => this.updatePresence(data.members)
            }
        )
    }

    disconnect() {
        this.subscription?.unsubscribe()
    }

    updatePresence(members) {
        if (!members) return
        const onlineIds = members.map(m => m.id)

        if (!this.hasMemberTarget) return

        this.memberTargets.forEach(el => {
            const userId = parseInt(el.dataset.presenceUserId)
            const dot    = el.querySelector(".bg-success")
            const online = onlineIds.includes(userId)

            if (online && !dot) {
                const span = document.createElement("span")
                span.className = "absolute bottom-0 right-0 block h-2.5 w-2.5 rounded-full bg-success ring-2 ring-surface"
                el.appendChild(span)
            } else if (!online && dot) {
                dot.remove()
            }
        })
    }

    avatarHTML(name) {
        const initials = name.split(" ").slice(0, 2).map(w => w[0].toUpperCase()).join("")
        return `<div class="inline-flex items-center justify-center rounded-full
                        bg-surface-alt text-text-muted font-medium overflow-hidden
                        h-8 w-8 text-xs" title="${name}">${initials}</div>`
    }
}