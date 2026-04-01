# frozen_string_literal: true

require_relative "../component_test_helper"

class ButtonTest < ActiveSupport::TestCase
  include ComponentTestHelper

  test "renders label" do
    html = render_component Components::Button.new(label: "Save")
    assert_includes html, ">Save<"
  end

  test "default variant is primary" do
    html = render_component Components::Button.new(label: "Save")
    assert_includes html, "bg-blue-600"
  end

  test "secondary variant" do
    html = render_component Components::Button.new(label: "Cancel", variant: :secondary)
    assert_includes html, "bg-gray-100"
  end

  test "danger variant" do
    html = render_component Components::Button.new(label: "Delete", variant: :danger)
    assert_includes html, "bg-red-600"
  end

  test "ghost variant" do
    html = render_component Components::Button.new(label: "Skip", variant: :ghost)
    assert_includes html, "bg-transparent"
  end

  test "small size" do
    html = render_component Components::Button.new(label: "Save", size: :sm)
    assert_includes html, "px-3"
    assert_includes html, "text-sm"
  end

  test "large size" do
    html = render_component Components::Button.new(label: "Save", size: :lg)
    assert_includes html, "px-6"
    assert_includes html, "text-lg"
  end

  test "disabled has disabled attribute" do
    doc = render_fragment Components::Button.new(label: "Save", disabled: true)
    assert doc.at_css("button[disabled]"), "Expected disabled attribute"
  end

  test "disabled has aria-disabled true" do
    doc = render_fragment Components::Button.new(label: "Save", disabled: true)
    assert_equal "true", doc.at_css("button")["aria-disabled"]
  end

  test "enabled has aria-disabled false" do
    doc = render_fragment Components::Button.new(label: "Save")
    assert_equal "false", doc.at_css("button")["aria-disabled"]
  end

  test "default type is button" do
    doc = render_fragment Components::Button.new(label: "Save")
    assert_equal "button", doc.at_css("button")["type"]
  end

  test "type can be set to submit" do
    doc = render_fragment Components::Button.new(label: "Save", type: "submit")
    assert_equal "submit", doc.at_css("button")["type"]
  end

  test "wrong label type raises" do
    assert_raises(Literal::TypeError) { Components::Button.new(label: 42) }
  end

  test "wrong variant type raises" do
    assert_raises(Literal::TypeError) { Components::Button.new(label: "Save", variant: "primary") }
  end
end
