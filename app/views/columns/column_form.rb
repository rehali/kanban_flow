# app/views/columns/column_form.rb
class Views::Columns::ColumnForm < Components::Base
  prop :column, ::Column
  prop :board,  _Nilable(::Board), default: -> { nil }
  PERMITTED = [:name].freeze
  def self.permitted = PERMITTED

  def view_template
    form_with(
      model: @column.persisted? ? @column : [@board, @column],
      class: "space-y-2",
      data:  { action: "submit->column-form#submit" }
    ) do |f|
      f.text_field :name,
                   autofocus:   true,
                   placeholder: "Column name",
                   class:       "w-full rounded-md border border-border px-3 py-2 " \
                     "text-sm bg-surface text-text " \
                     "placeholder:text-text-subtle " \
                     "focus:outline-none focus:ring-2 focus:ring-primary",
                   data: { column_form_target: "input" }

      p(
        hidden: true,
        class:  "text-danger text-xs",
        data:   { column_form_target: "error" }
      )

      div(class: "flex gap-2 mt-1") do
        Button(label: @column.persisted? ? "Save" : "Add column",
               type: "submit", size: :sm)
        button(
          type:  "button",
          class: "text-sm text-text-muted hover:text-text px-2 py-1",
          data:  { action: "click->column-form#hideForm" }
        ) { "Cancel" }
      end
    end
  end
end