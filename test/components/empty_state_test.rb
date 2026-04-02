# test/components/empty_state_test.rb
require "test_helper"
require "component_test_helper"
class EmptyStateTest < ActiveSupport::TestCase
  include ComponentTestHelper
  test "renders title and message" do
    html = render_component Components::EmptyState.new(
      title:   "Nothing here",
      message: "Add something to get started."
    )
    assert_includes html, "Nothing here"
    assert_includes html, "Add something to get started."
  end
  test "renders action link when both label and url provided" do
    doc = render_fragment Components::EmptyState.new(
      title:        "No boards",
      message:      "Create one.",
      action_label: "Create a board",
      action_url:   "/boards/new"
    )
    assert doc.at_css("a[href='/boards/new']"), "Expected action link"
    assert_includes doc.at_css("a").text, "Create a board"
  end
  test "no action link when action_label missing" do
    doc = render_fragment Components::EmptyState.new(
      title:      "No boards",
      message:    "Create one.",
      action_url: "/boards/new"
    )
    assert_nil doc.at_css("a"), "Expected no action link"
  end
  test "no action link when action_url missing" do
    doc = render_fragment Components::EmptyState.new(
      title:        "No boards",
      message:      "Create one.",
      action_label: "Create a board"
    )
    assert_nil doc.at_css("a"), "Expected no action link"
  end
  test "wrong title type raises" do
    assert_raises(Literal::TypeError) do
      Components::EmptyState.new(title: 42, message: "msg")
    end
  end
end
