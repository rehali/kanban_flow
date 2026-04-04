# app/views/boards/board_form.rb
class Views::Boards::BoardForm < Components::Base
  PERMITTED = [:name].freeze
  def self.permitted = PERMITTED

  prop :board, Board

  def view_template
    form_with(model: @board, class: "space-y-4") do |f|
      TextInput(
        form: f,
        field:       :name,
        label:       "Board name",
        value:       @board.name,
        placeholder: "e.g. Marketing Q3",
        error:       @board.errors[:name].first,
        required:    true
      )
      div(class: "flex items-center gap-3 pt-2") do
        Button(
          label: @board.persisted? ? "Update board" : "Create board",
          type:  "submit"
        )
        Button(label: "Cancel", variant: :outline, href: boards_path)
      end
    end
  end
end
