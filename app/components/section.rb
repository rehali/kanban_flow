# app/components/section.rb

module Components
  class Section < Base
    prop :title, String

    def view_template(&)
      vanish(&)

      section do
        h2 { @title }
        div(class: "section-grid") do
          div(class: "section-body")  { raw safe(@body)  if @body  }
          div(class: "section-aside") { raw safe(@aside) if @aside }
        end
      end
    end

    def body(&)  = @body  = capture(&)
    def aside(&) = @aside = capture(&)
  end
end