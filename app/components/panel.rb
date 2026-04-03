# frozen_string_literal: true

class Components::Panel < Components::Base
  prop :title, String

  def view_template
    div(class: "rounded-lg border border-border bg-surface p-4") do
      h4(class: "font-semibold text-text mb-3") { @title }
      yield
    end
  end
end
