# app/views/boards/index.rb
class Views::Boards::Index < Views::Base
  def page_title = "Your Boards"
  def initialize(boards:)
    @boards = boards
  end
  def view_template
    div(class: "flex items-center justify-between mb-6") do
      h1(class: "text-2xl font-bold text-gray-900") { "Your Boards" }
      a(href: new_board_path,
        class: "inline-flex items-center rounded-md bg-blue-600 px-4 py-2 " \
          "text-white font-medium hover:bg-blue-700 text-sm") do
        plain "+ New Board"
      end
    end
    if @boards.empty?
      EmptyState(
        title:        "No boards yet",
        message:      "Create your first board to get started.",
        action_label: "Create a board",
        action_url:   new_board_path
      )
    else
      div(class: "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4") do
        @boards.each { |board| render_board_card(board) }
      end
    end
  end
  private
  def render_board_card(board)
    a(href: board_path(board),
      class: "block p-6 bg-white rounded-lg border hover:shadow-md " \
        "transition-shadow") do
      h2(class: "font-semibold text-gray-900 mb-1") { board.name }
      p(class: "text-sm text-gray-500") do
        plain "#{board.columns.count} columns · #{board.members.count} members"
      end
    end
  end
end
