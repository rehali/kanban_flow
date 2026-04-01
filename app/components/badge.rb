# frozen_string_literal: true

class Components::Badge < Components::Base
  VARIANTS = {
    default: "bg-gray-100 text-gray-800",
    primary: "bg-blue-100 text-blue-800",
    success: "bg-green-100 text-green-800",
    warning: "bg-yellow-100 text-yellow-800",
    danger:  "bg-red-100 text-red-800",
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
