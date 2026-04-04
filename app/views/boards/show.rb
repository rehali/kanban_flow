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

    div(class: "flex items-center justify-between mt-4 mb-6") do
      h1(class: "text-2xl font-bold text-text") { @board.name }
      Button(label: "← Back to boards", href: boards_path, variant: :outline)
      div(class: "flex items-center gap-3") do
        Button(label: "Edit", href: edit_board_path(@board), variant: :secondary)
        Button(label: "Delete board", href: board_path(@board), variant: :danger,
               data: { turbo_method: :delete, turbo_confirm: "Delete #{@board.name}? This cannot be undone." })
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
