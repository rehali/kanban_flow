# frozen_string_literal: true

class Components::Heading < Components::Base
  SIZES = {
    1 => "text-4xl font-bold text-gray-900",
    2 => "text-3xl font-bold text-gray-900",
    3 => "text-2xl font-semibold text-gray-900",
    4 => "text-xl font-semibold text-gray-800",
    5 => "text-lg font-semibold text-gray-800",
    6 => "text-base font-semibold text-gray-700",
  }.freeze

  prop :text,  String
  prop :level, _Union(1, 2, 3, 4, 5, 6), default: 1

  def view_template
    send(:"h#{@level}", class: SIZES[@level]) { @text }
  end
end
