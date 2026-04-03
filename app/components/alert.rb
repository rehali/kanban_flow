# frozen_string_literal: true

class Components::Alert < Components::Base
  VARIANTS = {
    info:    { bg: "bg-info-bg",    border: "border-info/30",    text: "text-info",    icon: "ℹ" },
    success: { bg: "bg-success-bg", border: "border-success/30", text: "text-success", icon: "✓" },
    warning: { bg: "bg-warning-bg", border: "border-warning/30", text: "text-warning", icon: "⚠" },
    danger:  { bg: "bg-danger/10",  border: "border-danger/30",  text: "text-danger",  icon: "✕" },
  }.freeze

  prop :message,     String
  prop :variant,     Symbol,   default: :info
  prop :dismissible, _Boolean, default: -> { false }

  def view_template
    div(class: alert_classes, role: "alert") do
      div(class: "flex items-start gap-3") do
        span(class: "text-lg leading-none shrink-0") { styles[:icon] }
        span(class: "flex-1 text-sm") { @message }
        if @dismissible
          button(
            type:  "button",
            class: "ml-auto shrink-0 opacity-70 hover:opacity-100 " \
                   "text-current focus:outline-none"
          ) { "×" }
        end
      end
    end
  end

  private

  def styles = VARIANTS[@variant]

  def alert_classes
    class_names(
      "rounded-md border p-4",
      styles[:bg],
      styles[:border],
      styles[:text]
    )
  end
end
