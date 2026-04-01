# app/components/link.rb

module Components
  class Link < Base
    prop :label,   String
    prop :href,    String
    prop :variant, Symbol, default: :default

    def view_template
      case @variant
      when :button
        a(href: @href, role: "button") { @label }
      when :secondary
        a(href: @href, class: "secondary") { @label }
      else
        a(href: @href) { @label }
      end
    end
  end
end