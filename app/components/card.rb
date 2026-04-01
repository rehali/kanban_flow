# app/components/card.rb
require_relative "base"

module Components
  class Card < Base
    def view_template(&)
      vanish(&)

      article do
        div(class: "card-header") { raw safe(@header)  if @header  }
        div(class: "card-body")   { raw safe(@body)  if @body  }
        div(class: "card-footer") { raw safe(@footer)  if @footer  }
      end
    end

    def header(&) = @header = capture(&)
    def body(&) = @body = capture(&)
    def footer(&) = @footer = capture(&)
  end
end
