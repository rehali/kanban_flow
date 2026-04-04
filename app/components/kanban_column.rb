# app/components/kanban_column.rb
class Components::KanbanColumn < Components::Base
  prop :column, ::Column

  def view_template
    div(
      id:    dom_id(@column),
      class: "flex flex-col bg-surface-alt rounded-lg p-3 w-72 shrink-0",
      data:  { column_id: @column.id }
    ) do
      render_header
      render_cards
      render_add_card
    end
  end

  private

  def render_header
    div(class: "flex items-center justify-between mb-3") do
      h2(class: "font-semibold text-text text-sm") { @column.name }
      Badge(label: @column.cards.count.to_s)
    end
  end

  def render_cards
    div(class: "flex flex-col gap-2 min-h-8") do
      @column.cards.ordered.each do |card|
        KanbanCard(card: card)
      end
    end
  end

  def render_add_card
    div(class: "mt-2") do
      a(
        href:  new_column_card_path(@column),
        class: "flex items-center gap-1 text-sm text-text-muted " \
          "hover:text-text rounded px-2 py-1 hover:bg-surface"
      ) do
        plain "+ Add card"
      end
    end
  end
end