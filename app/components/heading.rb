# frozen_string_literal: true

class Components::Heading < Components::Base
  SIZES = {
    1 => "text-4xl font-bold text-text",
    2 => "text-3xl font-bold text-text",
    3 => "text-2xl font-semibold text-text",
    4 => "text-xl font-semibold text-text",
    5 => "text-lg font-semibold text-text",
    6 => "text-base font-semibold text-text-muted",
  }.freeze
  prop :text,  String
  prop :level, _Union(1, 2, 3, 4, 5, 6), default: 1

  def view_template
    send(:"h#{@level}", class: SIZES[@level]) { @text }
  end
end
