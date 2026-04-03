# frozen_string_literal: true

class Components::Badge < Components::Base
  VARIANTS = {
    default: "bg-surface-alt text-text-muted",
    primary: "bg-info-bg text-info",
    success: "bg-success-bg text-success",
    warning: "bg-warning-bg text-warning",
    danger:  "bg-danger/10 text-danger",
  }.freeze

  prop :label,   String
  prop :variant, Symbol, default: :default

  def view_template
    span(class: badge_classes) { @label }
  end

  private

  def badge_classes
    class_names(
      "inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-medium",
      VARIANTS[@variant]
    )
  end
end
