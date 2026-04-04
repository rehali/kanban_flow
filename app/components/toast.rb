class Components::Toast < Components::Base
  VARIANTS = {
    info:    "bg-surface border-border text-text",
    success: "bg-success-bg border-success/30 text-success",
    warning: "bg-warning-bg border-warning/30 text-warning",
    danger:  "bg-danger/10 border-danger/30 text-danger",
  }.freeze

  prop :message,  String
  prop :variant,  Symbol,  default: -> { :info }
  prop :duration, Integer, default: 4   # duration is in seconds

  def view_template
    div(
      role:  "status",
      class: toast_classes,
      data:  { controller: "toast", toast_duration_value: @duration * 1000 }
    ) do
      button(
        type:  "button",
        class: "absolute right-3 top-3 leading-none opacity-70 hover:opacity-100",
        data:  { action: "click->toast#dismiss" }
      ) { "×" }

      div(class: "flex items-start gap-3 pr-6") do
        span(class: "shrink-0") { Icon(name: icon_for(@variant)) }
        span(class: "flex-1 text-sm font-medium pt-0.5") { @message }
      end
    end
  end

  private

  def icon_for(variant)
    case variant
    when :info    then :information_circle
    when :success then :check_circle
    when :warning then :exclamation_triangle
    when :danger  then :x_circle
    end
  end

  def toast_classes
    "pointer-events-auto relative flex w-full max-w-sm rounded-lg border " \
      "shadow-lg px-4 py-3 #{VARIANTS[@variant]}"
  end
end