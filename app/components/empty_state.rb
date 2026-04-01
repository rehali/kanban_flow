# frozen_string_literal: true

class Components::EmptyState < Components::Base
  prop :title,        String
  prop :message,      String
  prop :action_label, _Nilable(String), default: -> { nil }
  prop :action_url,   _Nilable(String), default: -> { nil }

  def view_template
    div(class: "text-center py-12 px-4") do
      p(class: "text-4xl mb-4") { "📋" }
      h3(class: "text-lg font-semibold text-gray-900 mb-2") { @title }
      p(class: "text-gray-500 text-sm mb-6") { @message }
      if @action_label && @action_url
        a(
          href:  @action_url,
          class: "inline-flex items-center justify-center rounded-md font-medium " \
                 "bg-blue-600 text-white hover:bg-blue-700 px-4 py-2 text-sm " \
                 "focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2"
        ) { @action_label }
      end
    end
  end
end
