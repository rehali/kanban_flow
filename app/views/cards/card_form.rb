# app/views/cards/card_form.rb
class Views::Cards::CardForm < Components::Base
  PERMITTED = [:title, :description].freeze
  def self.permitted = PERMITTED

  prop :card,   ::Card
  prop :column, _Nilable(::Column), default: -> { nil }

  def view_template
    form_with(
      model: @card.persisted? ? @card : [@column, @card],
      class: "space-y-4"
    ) do |f|
      TextInput(
        form:        f,
        field:       :title,
        label:       "Title",
        value:       @card.title,
        placeholder: "Card title",
        error:       @card.errors[:title].first,
        required:    true
      )
      div(class: "flex items-center gap-3 pt-2") do
        Button(label: @card.persisted? ? "Save" : "Add card", type: "submit")
        Button(label: "Cancel", variant: :outline,
               href: board_path(@card.persisted? ? @card.column.board_id : @column.board_id))
      end
    end
  end
end