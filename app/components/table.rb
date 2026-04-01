# frozen_string_literal: true

class Components::Table < Components::Base
  prop :rows,    _Array(_Any)
  prop :caption, _Nilable(String), default: -> { nil }

  def after_initialize
    @columns = []
  end

  def view_template(&)
    vanish(&)

    div(class: "overflow-x-auto rounded-lg border border-gray-200") do
      table(class: "w-full text-sm text-left") do
        caption(class: "px-4 py-2 text-sm text-gray-500 text-left") { @caption } if @caption
        thead(class: "bg-gray-50 text-xs text-gray-700 uppercase tracking-wider") do
          tr do
            @columns.each do |col|
              th(class: "px-4 py-3 font-medium") { col[:header] }
            end
          end
        end
        tbody(class: "divide-y divide-gray-100") do
          @rows.each do |row|
            tr(class: "hover:bg-gray-50 transition-colors") do
              @columns.each do |col|
                td(class: "px-4 py-3 text-gray-700") do
                  plain col[:content].call(row).to_s
                end
              end
            end
          end
        end
      end
    end
  end

  def column(header, &content)
    @columns << { header:, content: }
    nil
  end
end
