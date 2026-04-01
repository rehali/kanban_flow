# app/components/button.rb
require_relative "base"

module Components
  class Button < Base
    VARIANTS = {
      primary:   nil,
      secondary: "secondary",
      danger:    "contrast",
      ghost:     "outline",
    }.freeze

    prop :label,    String
    prop :variant,  Symbol,  default: :primary
    prop :disabled, _Boolean, default: -> { false }
    prop :type,     String,  default: "button".freeze

    def view_template
      button(
        type:     @type,
        class:    VARIANTS[@variant],
        disabled: @disabled
      ) { @label }
    end
  end
end