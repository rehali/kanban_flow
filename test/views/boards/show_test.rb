# test/views/boards/show_test.rb
require "test_helper"
require "view_test_helper"
class Views::Boards::ShowTest < ActiveSupport::TestCase
  include ViewTestHelper

  def board
    @board ||= Board.new(name: "My Board", id: 1).tap do |b|
      b.columns.build(name: "To Do",       id: 1, position: 0)
      b.columns.build(name: "In Progress", id: 2, position: 1)
      b.columns.build(name: "Done",        id: 3, position: 2)
    end
  end

  test "renders board name as heading" do
    html = render_view Views::Boards::Show.new(board: board)
    assert_includes html, "My Board"
  end

  test "renders breadcrumb with boards link" do
    html = render_view Views::Boards::Show.new(board: board)
    assert_includes html, boards_path
  end

  test "renders all columns" do
    html = render_view Views::Boards::Show.new(board: board)
    assert_includes html, "To Do"
    assert_includes html, "In Progress"
    assert_includes html, "Done"
  end
end
