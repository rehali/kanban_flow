# frozen_string_literal: true

class Components::Alert < Components::Base
  VARIANTS = {
    info:    { bg: "bg-info-bg",    border: "border-info/30",    text: "text-info",    icon: :information_circle },
    success: { bg: "bg-success-bg", border: "border-success/30", text: "text-success", icon: :check_circle },
    warning: { bg: "bg-warning-bg", border: "border-warning/30", text: "text-warning", icon: :exclamation_triangle },
    danger:  { bg: "bg-danger/10",  border: "border-danger/30",  text: "text-danger",  icon: :x_circle },
  }.freeze

  prop :message,     String
  prop :variant,     Symbol,   default: -> { :info }
  prop :dismissible, _Boolean, default: -> { false }

  def view_template
    div(class: alert_classes, role: "alert", data: { controller: "alert" }) do
      div(class: "flex items-start gap-3") do
        Icon(name: styles[:icon], class_name: "h-5 w-5 shrink-0")
        span(class: "flex-1 text-sm") { @message }
        if @dismissible
          button(
            type:  "button",
            class: "ml-auto shrink-0 opacity-70 hover:opacity-100 " \
              "text-current focus:outline-none",
            data:  { action: "click->alert#dismiss" }
          ) do
            Icon(name: :x_mark, class_name: "h-4 w-4")
          end
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