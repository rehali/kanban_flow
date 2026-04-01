# frozen_string_literal: true

class Components::Link < Components::Base
  VARIANTS = {
    default:   "text-blue-600 hover:text-blue-800 underline underline-offset-2",
    secondary: "text-gray-600 hover:text-gray-800 underline underline-offset-2",
    button:    "inline-flex items-center justify-center rounded-md font-medium " \
               "bg-blue-600 text-white hover:bg-blue-700 px-4 py-2 " \
               "focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2",
  }.freeze

  prop :label,   String
  prop :href,    String
  prop :variant, Symbol, default: :default

  def view_template
    a(href: @href, class: VARIANTS[@variant]) { @label }
  end
end
