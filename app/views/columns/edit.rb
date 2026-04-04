# app/views/columns/edit.rb
class Views::Columns::Edit < Views::Base
  def page_title = "Edit column"

  def initialize(column:)
    @column = column
  end

  def view_template
    Breadcrumb() do |b|
      b.item "Boards",         url: boards_path
      b.item @column.board.name, url: board_path(@column.board)
      b.item "Edit column"
    end

    Panel(title: "Edit column") do
      render Views::Columns::ColumnForm(column: @column)
    end
  end
end