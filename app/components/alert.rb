# app/components/alert.rb
require_relative "base"
module Components
  class Alert < Base
    ICONS = {
      info:    "ℹ",
      success: "✓",
      warning: "⚠",
      danger:  "✕",
    }.freeze
    prop :message,     String
    prop :variant,     Symbol,   default: :info
    prop :dismissible, _Boolean, default: -> { false }

    def view_template
      div(role: "alert", class: @variant.to_s) do
        span { "#{ICONS[@variant]} #{@message}" }
        button(type: "button") { "×" } if @dismissible
      end
    end
  end
end
