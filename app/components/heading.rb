# app/components/heading.rb

module Components
  class Heading < Base
    prop :text,  String
    prop :level, _Union(1, 2, 3, 4, 5, 6), default: 1

    def view_template
      send(:"h#{@level}") { @text }
    end
  end
end