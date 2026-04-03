# frozen_string_literal: true

class Components::Card < Components::Base
  prop :title, _Nilable(String), default: -> { nil }

  def view_template(&)
    vanish(&)

    article(class: "rounded-lg border border-border bg-surface shadow-sm") do
      div(class: "card-header px-6 py-4 border-b border-border") do
        if @header
          raw safe(@header)
        elsif @title
          h3(class: "font-semibold text-lg text-text") { @title }
        end
      end if @title || @header

      div(class: "card-body px-6 py-4") { raw safe(@body) } if @body

      div(class: "card-footer px-6 py-4 border-t border-border bg-surface-alt") do
        raw safe(@footer)
      end if @footer
    end
  end

  def header(&) = @header = capture(&)
  def body(&)   = @body   = capture(&)
  def footer(&) = @footer = capture(&)
end
