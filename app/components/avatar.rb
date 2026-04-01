# app/components/avatar.rb
require_relative "base"

module Components
  class Avatar < Base
    prop :name,      String
    prop :image_url, _Nilable(String), default: nil
    prop :size,      Symbol,           default: :md

    def view_template
      div(class: avatar_classes) do
        if @image_url
          img(src: @image_url, alt: @name)
        else
          plain initials
        end
      end
    end

    private

    def initials
      @name.split.first(2).map { |w| w[0].upcase }.join
    end

    def avatar_classes
      class_names("avatar", @size == :md ? nil : @size.to_s)
    end
  end
end