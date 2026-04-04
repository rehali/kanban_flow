# app/views/columns/new.rb
class Views::Columns::New < Views::Base
  def page_title = "Add column"

  def initialize(column:, board:)
    @column = column
    @board  = board
  end

  def view_template
    Breadcrumb() do |b|
      b.item "Boards",    url: boards_path
      b.item @board.name, url: board_path(@board)
      b.item "Add column"
    end

    Panel(title: "Add column") do
      render Views::Columns::ColumnForm.new(column: @column, board: @board)
    end
  end
end