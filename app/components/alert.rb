# frozen_string_literal: true

class Components::Alert < Components::Base
  VARIANTS = {
    info:    { bg: "bg-blue-50",   border: "border-blue-200",  text: "text-blue-800",  icon: "ℹ" },
    success: { bg: "bg-green-50",  border: "border-green-200", text: "text-green-800", icon: "✓" },
    warning: { bg: "bg-yellow-50", border: "border-yellow-200",text: "text-yellow-800",icon: "⚠" },
    danger:  { bg: "bg-red-50",    border: "border-red-200",   text: "text-red-800",   icon: "✕" },
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
