# frozen_string_literal: true

class Components::Button < Components::Base
  BASE_CLASSES = "inline-flex items-center justify-center rounded-md " \
    "font-medium transition-colors border " \
    "focus:outline-none focus:ring-2 focus:ring-offset-2 " \
    "disabled:opacity-50 disabled:pointer-events-none"

  VARIANTS = {
    primary:   "bg-blue-600 text-white border-transparent hover:bg-blue-700 " \
      "focus:ring-blue-500",
    secondary: "bg-green-600 text-white border-transparent hover:bg-green-700 " \
      "focus:ring-gray-300",
    outline:   "bg-transparent text-gray-700 border-gray-300 " \
      "hover:bg-gray-50 focus:ring-gray-300",
    danger:    "bg-red-600 text-white border-transparent hover:bg-red-700 " \
      "focus:ring-red-500",
  }.freeze

  SIZES = {
    sm: "px-3 py-1.5 text-sm",
    md: "px-4 py-2 text-sm",
    lg: "px-6 py-3 text-base",
  }.freeze

  prop :label,    String
  prop :variant,  Symbol,           default: -> { :primary }
  prop :size,     Symbol,           default: -> { :md }
  prop :href,     _Nilable(String), default: -> { nil }
  prop :type,     _Nilable(String), default: -> { nil }
  prop :disabled, _Boolean,         default: -> { false }
  prop :data,     _Nilable(_Any),   default: -> { nil }

  def view_template
    if @href
      a(
        href:  @href,
        class: button_classes,
        data:  @data
      ) { plain @label }
    elsif @type
      button(
        type:     @type,
        class:    button_classes,
        disabled: @disabled,
        aria:     { disabled: @disabled.to_s },
        data:     @data
      ) { plain @label }
    else
      raise ArgumentError,
            "#{self.class.name} requires either href: or type:"
    end
  end

  private

  def button_classes
    "#{BASE_CLASSES} #{VARIANTS[@variant]} #{SIZES[@size]}"
  end
end