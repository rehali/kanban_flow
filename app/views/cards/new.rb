# app/views/cards/new.rb
class Views::Cards::New < Views::Base
  def page_title = "Add card"

  def initialize(card:, column:)
    @card   = card
    @column = column
  end

  def view_template
    Breadcrumb() do |b|
      b.item "Boards",           url: boards_path
      b.item @column.board.name, url: board_path(@column.board)
      b.item "Add card"
    end

    Panel(title: "Add card") do
      render Views::Cards::CardForm.new(card: @card, column: @column)
    end
  end
end