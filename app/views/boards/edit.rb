# app/views/boards/edit.rb
class Views::Boards::Edit < Views::Base
  def page_title = "Edit #{@board.name}"
  def initialize(board:)
    @board = board
  end
  def view_template
    Breadcrumb() do |b|
      b.item "Boards",    url: boards_path
      b.item @board.name, url: board_path(@board)
      b.item "Edit"
    end
    div(class: "max-w-lg mt-6") do
      h1(class: "text-2xl font-bold text-text mb-6") { "Edit Board" }
      render Views::Boards::BoardForm.new(board: @board)
    end
  end
end
