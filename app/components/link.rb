# frozen_string_literal: true

class Components::Link < Components::Base
  VARIANTS = {
    default:   "text-primary hover:text-primary-hover underline underline-offset-2",
    secondary: "text-text-muted hover:text-text underline underline-offset-2",
    button:    "inline-flex items-center justify-center rounded-md font-medium " \
      "bg-primary text-white hover:bg-primary-hover px-4 py-2 " \
      "focus:outline-none focus:ring-2 focus:ring-primary focus:ring-offset-2",
  }.freeze

  prop :label,   String
  prop :href,    String
  prop :variant, Symbol, default: :default

  def view_template
    a(href: @href, class: VARIANTS[@variant]) { @label }
  end
end
