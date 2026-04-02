# frozen_string_literal: true

class Components::Table < Components::Base
  prop :rows,    _Array(_Any)
  prop :caption, _Nilable(String), default: -> { nil }

  def after_initialize
    @columns      = []
    @action_block = nil
  end

  def view_template(&)
    vanish(&)
    if @rows.empty?
      render_empty_state
    else
      render_table
    end
  end

  def column(header, &content)
    @columns << { header:, content: }
    nil
  end

  def actions(&block)
    @action_block = block
    nil
  end

  private

  def render_empty_state
    EmptyState(
      title:   "No records found",
      message: "There's nothing to display yet."
    )
  end

  def render_table
    div(class: "overflow-x-auto rounded-lg border border-gray-200") do
      table(class: "w-full text-sm text-left") do
        caption(class: "px-4 py-2 text-sm text-gray-500 text-left") do
          @caption
        end if @caption
        thead(class: "bg-gray-50 text-xs text-gray-700 uppercase tracking-wider") do
          tr do
            @columns.each do |col|
              th(class: "px-4 py-3 font-medium") { col[:header] }
            end
            th(class: "px-4 py-3 font-medium") { "Actions" } if @action_block
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
              if @action_block
                td(class: "px-4 py-3") do
                  instance_exec(row, &@action_block)
                end
              end
            end
          end
        end
      end
    end
  end
end
