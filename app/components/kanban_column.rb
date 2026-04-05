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
    div(
      class: "mb-3",
      data:  { controller: "column-form" }
    ) do
      render_column_display
      render_column_edit_form
    end
  end

  def render_column_display
    div(
      class: "flex items-center justify-between cursor-grab " \
        "active:cursor-grabbing",
      data:  {
        column_handle:      true,
        column_form_target: "display"
      }
    ) do
      h2(class: "font-semibold text-text text-sm flex-1") { @column.name }
      Badge(label: @column.cards.count.to_s)
      div(class: "flex gap-1 ml-2") do
        button(
          type:  "button",
          class: "text-text-muted hover:text-text p-1 rounded",
          data:  { action: "click->column-form#showForm" }
        ) do
          Icon(name: :pencil, class_name: "h-3 w-3")
        end
        render_delete_column_button
      end
    end
  end

  def render_column_edit_form
    div(
      hidden: true,
      data:   { column_form_target: "form" }
    ) do
      render Views::Columns::ColumnForm.new(column: @column)
    end
  end

  def render_delete_column_button
    form_with(url: column_path(@column), method: :delete) do
      button(
        type:  "submit",
        class: "text-text-muted hover:text-danger p-1 rounded",
        data:  { turbo_confirm: delete_confirm_message }
      ) do
        Icon(name: :x_mark, class_name: "h-3 w-3")
      end
    end
  end

  def delete_confirm_message
    count = @column.cards.count
    if count == 0
      "Delete column \"#{@column.name}\"?"
    elsif count == 1
      "Delete column \"#{@column.name}\" and its 1 card?"
    else
      "Delete column \"#{@column.name}\" and all #{count} cards?"
    end
  end

  def render_cards
    div(
      id:    "cards_#{@column.id}",
      class: "flex flex-col gap-2 min-h-8 flex-1",
      data:  { card_list: @column.id }
    ) do
      @column.cards.ordered.each { |card| KanbanCard(card: card) }
    end
  end

  def render_add_card
    div(data: { controller: "card-form" }) do
      button(
        type:  "button",
        class: "flex items-center gap-1 text-sm text-text-muted " \
          "hover:text-text rounded px-2 py-1 hover:bg-surface w-full mt-2",
        data:  {
          card_form_target: "link",
          action:           "click->card-form#showForm"
        }
      ) do
        plain "+ Add card"
      end

      div(
        hidden: true,
        class:  "mt-2",
        data:   { card_form_target: "form" }
      ) do
        render Views::Cards::CardForm.new(
          card:   @column.cards.build,
          column: @column
        )
      end
    end
  end
end