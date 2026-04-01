# frozen_string_literal: true

class Components::Panel < Components::Base
  prop :title, String

  def view_template
    div(class: "rounded-lg border border-gray-200 bg-white p-4") do
      h4(class: "font-semibold text-gray-900 mb-3") { @title }
      yield
    end
  end
end
