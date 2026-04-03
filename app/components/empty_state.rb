# frozen_string_literal: true

class Components::EmptyState < Components::Base
  prop :title,        String
  prop :message,      String
  prop :action_label, _Nilable(String), default: -> { nil }
  prop :action_url,   _Nilable(String), default: -> { nil }

  def view_template
    div(class: "text-center py-12 px-4") do
      p(class: "text-4xl mb-4") { "📋" }
      h3(class: "text-lg font-semibold text-text mb-2") { @title }
      p(class: "text-text-muted text-sm mb-6") { @message }
      if @action_label && @action_url
        Button(label: @action_label, href: @action_url)
      end
    end
  end
end
