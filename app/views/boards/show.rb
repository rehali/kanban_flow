# app/views/boards/show.rb
class Views::Boards::Show < Views::Base
  def page_title = @board.name

  def initialize(board:)
    @board = board
  end

  def view_template
    render_header
    render_board
  end

  private

  def render_header
    Breadcrumb() do |b|
      b.item "Boards", url: boards_path
      b.item @board.name
    end

    div(class: "flex items-center justify-between mt-4 mb-6") do
      h1(class: "text-2xl font-bold text-text") { @board.name }
      Dropdown(label: "Board actions", align: :right) do |d|
        d.item "Edit board",   url: edit_board_path(@board)
        d.item "Delete board", url: board_path(@board), method: :delete
      end
    end
  end

  def render_board
    div(
      id:    dom_id(@board),
      class: "flex gap-4 overflow-x-auto pb-4"
    ) do
      @board.columns.ordered.each do |column|
        KanbanColumn(column: column)
      end
      render_add_column
    end
  end

  def render_add_column
    div(class: "w-72 shrink-0") do
      a(
        href:  new_board_column_path(@board),
        class: "flex items-center gap-2 text-sm text-text-muted " \
          "hover:text-text bg-surface-alt/50 rounded-lg p-3 " \
          "border-2 border-dashed border-border " \
          "hover:border-border-strong"
      ) do
        plain "+ Add column"
      end
    end
  end
end