# app/views/cards/card_form.rb
class Views::Cards::CardForm < Components::Base
  prop :card,   ::Card
  prop :column, _Nilable(::Column), default: -> { nil }
  PERMITTED = [:title].freeze
  def self.permitted = PERMITTED

  def view_template
    form_with(
      model: @card.persisted? ? @card : [@column, @card],
      class: "space-y-2",
      data:  { action: "submit->card-form#submit" }
    ) do |f|
      f.text_field :title,
                   autofocus:   true,
                   placeholder: "Card title",
                   class:       "w-full rounded-md border border-border px-3 py-2 " \
                     "text-sm bg-surface text-text " \
                     "placeholder:text-text-subtle " \
                     "focus:outline-none focus:ring-2 focus:ring-primary",
                   data: { card_form_target: "input" }

      p(
        hidden: true,
        class:  "text-danger text-xs",
        data:   { card_form_target: "error" }
      )

      div(class: "flex gap-2") do
        Button(label: @card.persisted? ? "Save" : "Add card",
               type: "submit", size: :sm)
        button(
          type:  "button",
          class: "text-sm text-text-muted hover:text-text px-2 py-1",
          data:  { action: "click->card-form#hideForm" }
        ) { "Cancel" }
      end
    end
  end
end