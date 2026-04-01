# app/components/badge.rb

module Components
  class Badge < Base
    prop :label,   String
    prop :variant, Symbol, default: :default

    def view_template
      mark(class: @variant == :default ? nil : @variant.to_s) { @label }
    end
  end
end