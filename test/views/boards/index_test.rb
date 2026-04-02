# test/views/boards/index_test.rb
require "test_helper"
require "view_test_helper"

class Views::Boards::IndexTest < ActiveSupport::TestCase
  include ViewTestHelper

  test "shows empty state when no boards" do
    html = render_view Views::Boards::Index.new(boards: [])
    assert_includes html, "No boards yet"
    assert_includes html, "Create your first board to get started"
  end

  test "renders board names when boards present" do
    boards = [
      Board.new(name: "Alpha", id: 1),
      Board.new(name: "Beta",  id: 2),
    ]
    html = render_view Views::Boards::Index.new(boards: boards)
    assert_includes html, "Alpha"
    assert_includes html, "Beta"
  end

  test "shows new board link" do
    html = render_view Views::Boards::Index.new(boards: [])
    assert_includes html, new_board_path
  end

  test "renders grid when boards present" do
    boards = [Board.new(name: "Alpha", id: 1)]
    doc = render_view_fragment Views::Boards::Index.new(boards: boards)
    assert doc.at_css(".grid"), "Expected a grid container"
  end
end
