# app/views/boards/new.rb
class Views::Boards::New < Views::Base
  def page_title = "New Board"
  def initialize(board:)
    @board = board
  end
  def view_template
    Breadcrumb() do |b|
      b.item "Boards", url: boards_path
      b.item "New Board"
    end
    div(class: "max-w-lg mt-6") do
      h1(class: "text-2xl font-bold text-text mb-6") { "New Board" }
      render Views::Boards::BoardForm.new(board: @board)
    end
  end
end
