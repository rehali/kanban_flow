# app/components/kanban_card.rb
class Components::KanbanCard < Components::Base
  prop :card, ::Card

  # app/components/kanban_card.rb
  def view_template
    div(
      id:    dom_id(@card),
      class: "bg-surface rounded-md border border-border p-3 " \
        "shadow-sm hover:shadow-md transition-shadow",
      data:  {
        controller: "card-form",
        card_id:    @card.id
      }
    ) do
      render_display
      render_edit_form
    end
  end

  private

  def render_display
    div(
      class: "flex items-start justify-between gap-2 cursor-grab " \
        "active:cursor-grabbing",
      data:  { card_form_target: "link" }
    ) do
      p(class: "text-sm text-text flex-1") { @card.title }
      div(class: "flex gap-1 shrink-0") do
        button(
          type:  "button",
          class: "text-text-muted hover:text-text p-1 rounded",
          data:  { action: "click->card-form#showForm" }
        ) do
          Icon(name: :pencil, class_name: "h-3 w-3")
        end
        render_delete_button
      end
    end
  end

  def render_edit_form
    div(
      hidden: true,
      data:   { card_form_target: "form" }
    ) do
      render Views::Cards::CardForm.new(card: @card)
    end
  end

  def render_delete_button
    form_with(url: card_path(@card), method: :delete) do
      button(
        type:  "submit",
        class: "text-text-muted hover:text-danger p-1 rounded",
        data:  { turbo_confirm: "Delete this card?" }
      ) do
        Icon(name: :x_mark, class_name: "h-3 w-3")
      end
    end
  end
end