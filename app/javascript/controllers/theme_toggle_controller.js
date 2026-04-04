// app/javascript/controllers/theme_toggle_controller.js
import { Controller } from "@hotwired/stimulus"

const THEMES = ["default", "forest", "ember"]

export default class extends Controller {
    static targets = ["icon", "currentIcon", "currentLabel", "dropdown", "themeOption"]

    connect() {
        this.applyTheme(this.savedTheme)
        this.applyMode(this.savedMode)
        document.addEventListener("click", this.closeOnOutsideClick.bind(this))
    }

    disconnect() {
        document.removeEventListener("click", this.closeOnOutsideClick.bind(this))
    }

    // Dark/light toggle
    toggle() {
        const isDark = this.currentlyDark
        const next   = isDark ? "light" : "dark"
        localStorage.setItem("mode", next)
        this.applyMode(next)
    }

    // Theme dropdown
    toggleDropdown() {
        this.dropdownTarget.hidden = !this.dropdownTarget.hidden
    }

    selectTheme(event) {
        const themeId = event.currentTarget.dataset.themeId
        localStorage.setItem("theme", themeId)
        this.applyTheme(themeId)
        this.dropdownTarget.hidden = true
    }

    closeOnOutsideClick(event) {
        if (!this.element.contains(event.target)) {
            if (this.hasDropdownTarget) this.dropdownTarget.hidden = true
        }
    }

    // Apply theme to <html>
    applyTheme(themeId) {
        const html = document.documentElement
        html.dataset.theme = themeId === "default" ? "" : themeId
        this.updateThemeIndicator(themeId)
    }

    // Apply mode to <html>
    applyMode(mode) {
        const html = document.documentElement
        if (mode === "dark") {
            html.classList.add("dark")
            html.classList.remove("light")
        } else if (mode === "light") {
            html.classList.add("light")
            html.classList.remove("dark")
        } else {
            html.classList.remove("dark", "light")
        }
        this.updateModeIcon()
    }

    updateModeIcon() {
        if (this.hasIconTarget) {
            this.iconTarget.textContent = this.currentlyDark ? "☀️" : "🌙"
        }
    }

    updateThemeIndicator(themeId) {
        const themes = {
            default: { icon: "💧", label: "Default" },
            forest:  { icon: "🌲", label: "Forest"  },
            ember:   { icon: "🔥", label: "Ember"   },
        }
        const theme = themes[themeId] || themes.default

        if (this.hasCurrentIconTarget)  this.currentIconTarget.textContent  = theme.icon
        if (this.hasCurrentLabelTarget) this.currentLabelTarget.textContent = theme.label

        // Highlight active option in dropdown
        if (this.hasThemeOptionTarget) {
            this.themeOptionTargets.forEach(option => {
                const isActive = option.dataset.themeId === themeId
                option.classList.toggle("font-semibold", isActive)
                option.classList.toggle("text-primary",  isActive)
            })
        }
    }

    get currentlyDark() {
        return document.documentElement.classList.contains("dark") ||
            (!document.documentElement.classList.contains("light") &&
                window.matchMedia("(prefers-color-scheme: dark)").matches)
    }

    get savedTheme() {
        return localStorage.getItem("theme") || "default"
    }

    get savedMode() {
        return localStorage.getItem("mode")
    }
}