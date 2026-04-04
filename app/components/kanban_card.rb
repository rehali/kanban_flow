# app/components/kanban_card.rb
class Components::KanbanCard < Components::Base
  prop :card, ::Card

  def view_template
    div(
      id:    dom_id(@card),
      class: "bg-surface rounded-md border border-border p-3 " \
        "shadow-sm cursor-grab active:cursor-grabbing " \
        "hover:shadow-md transition-shadow",
      data:  { card_id: @card.id }
    ) do
      render_content
    end
  end

  private

  def render_content
    div(class: "flex items-start justify-between gap-2") do
      p(class: "text-sm text-text flex-1") { @card.title }
      render_actions
    end
  end

  def render_actions
    Dropdown(label: "⋯", align: :right) do |d|
      d.item "Edit",   url: edit_card_path(@card.column, @card)
      d.item "Delete", url: card_path(@card.column, @card),
             method: :delete
    end
  end
end