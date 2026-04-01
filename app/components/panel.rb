# app/components/panel.rb

module Components
  class Panel < Base
    prop :title, String

    def view_template
      section(class: "section-border") do
        h4 { @title }
        yield
      end
    end
  end
end