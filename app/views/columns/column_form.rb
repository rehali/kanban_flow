# app/views/columns/column_form.rb
class Views::Columns::ColumnForm < Components::Base
  PERMITTED = [:name].freeze
  def self.permitted = PERMITTED

  prop :column, ::Column
  prop :board,  _Nilable(::Board), default: -> { nil }

  def view_template
    form_with(
      model: @column.persisted? ? @column : [@board, @column],
      class: "space-y-4"
    ) do |f|
      TextInput(
        form:        f,
        field:       :name,
        label:       "Column name",
        value:       @column.name,
        placeholder: "e.g. To Do",
        error:       @column.errors[:name].first,
        required:    true
      )
      div(class: "flex items-center gap-3 pt-2") do
        Button(label: @column.persisted? ? "Update column" : "Add column", type: "submit")
        Button(label: "Cancel", variant: :outline,
               href: board_path(@column.persisted? ? @column.board_id : @board.id))
      end
    end
  end
end