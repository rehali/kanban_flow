# app/views/boards/show.rb
class Views::Boards::Show < Views::Base
  def page_title = @board.name
  def initialize(board:)
    @board = board
  end
  def view_template
    Breadcrumb() do |b|
      b.item "Boards", url: boards_path
      b.item @board.name
    end

    div(class: "flex items-center justify-between mb-6") do
      h1(class: "text-2xl font-bold text-gray-900") { @board.name }
      a(href: boards_path,
        class: "text-sm text-blue-600 hover:underline") { "← Back to boards" }
    end
    div(class: "grid grid-cols-1 md:grid-cols-3 gap-4") do
      @board.columns.each do |column|
        render_column(column)
      end
    end
  end
  private
  def render_column(column)
    div(class: "bg-gray-100 rounded-lg p-4") do
      h2(class: "font-semibold text-gray-700 mb-3") { column.name }
      p(class: "text-sm text-gray-400") do
        plain "#{column.cards.count} cards · Full board view in Module 9."
      end
    end
  end
end
