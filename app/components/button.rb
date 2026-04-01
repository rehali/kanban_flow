# frozen_string_literal: true

class Components::Button < Components::Base
  BASE_CLASSES = "inline-flex items-center justify-center rounded-md " \
                 "font-medium transition-colors focus:outline-none " \
                 "focus:ring-2 focus:ring-offset-2 disabled:opacity-50 " \
                 "disabled:pointer-events-none"

  VARIANTS = {
    primary:   "bg-blue-600 text-white hover:bg-blue-700 focus:ring-blue-500",
    secondary: "bg-gray-100 text-gray-900 hover:bg-gray-200 focus:ring-gray-500",
    danger:    "bg-red-600 text-white hover:bg-red-700 focus:ring-red-500",
    ghost:     "bg-transparent text-gray-700 hover:bg-gray-100 focus:ring-gray-500",
  }.freeze

  SIZES = {
    sm: "px-3 py-1.5 text-sm",
    md: "px-4 py-2 text-base",
    lg: "px-6 py-3 text-lg",
  }.freeze

  prop :label,    String
  prop :variant,  Symbol,   default: :primary
  prop :size,     Symbol,   default: :md
  prop :disabled, _Boolean, default: -> { false }
  prop :type,     String,   default: -> { "button" }

  def view_template
    button(
      type:     @type,
      class:    class_names(BASE_CLASSES, VARIANTS[@variant], SIZES[@size]),
      disabled: @disabled,
      aria:     { disabled: @disabled.to_s }
    ) { @label }
  end
end
