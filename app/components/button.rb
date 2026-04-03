# frozen_string_literal: true

class Components::Button < Components::Base
  BASE_CLASSES = "inline-flex items-center justify-center rounded-md " \
    "font-medium transition-colors border " \
    "focus:outline-none focus:ring-2 focus:ring-offset-2 " \
    "disabled:opacity-50 disabled:pointer-events-none"

  VARIANTS = {
    primary:   "bg-primary text-white border-transparent hover:bg-primary-hover " \
      "focus:ring-primary-ring",
    secondary: "bg-secondary text-white border-transparent hover:bg-secondary-hover " \
      "focus:ring-secondary-ring",
    outline:   "bg-transparent text-outline-text border-outline-border " \
      "hover:bg-outline-hover focus:ring-outline-border",
    danger:    "bg-danger text-white border-transparent hover:bg-danger-hover " \
      "focus:ring-danger-ring",
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