# frozen_string_literal: true

class Components::Avatar < Components::Base
  SIZES = {
    sm: "h-8 w-8 text-xs",
    md: "h-10 w-10 text-sm",
    lg: "h-12 w-12 text-base",
  }.freeze

  prop :name,      String
  prop :image_url, _Nilable(String), default: -> { nil }
  prop :size,      Symbol,           default: :md

  def view_template
    div(class: avatar_classes) do
      if @image_url
        img(src: @image_url, alt: @name, class: "h-full w-full object-cover")
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
    class_names(
      "inline-flex items-center justify-center rounded-full",
      "bg-gray-200 text-gray-700 font-medium overflow-hidden",
      SIZES[@size]
    )
  end
end
