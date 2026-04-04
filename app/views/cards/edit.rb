# app/views/cards/edit.rb
class Views::Cards::Edit < Views::Base
  def page_title = "Edit card"

  def initialize(card:)
    @card = card
  end

  def view_template
    Breadcrumb() do |b|
      b.item "Boards",              url: boards_path
      b.item @card.column.board.name, url: board_path(@card.column.board)
      b.item "Edit card"
    end

    Panel(title: "Edit card") do
      render Views::Cards::CardForm(card: @card)
    end
  end
end