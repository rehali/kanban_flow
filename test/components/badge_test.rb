# frozen_string_literal: true

require_relative "../component_test_helper"

class BadgeTest < ActiveSupport::TestCase
  include ComponentTestHelper

  test "renders label" do
    html = render_component Components::Badge.new(label: "Active")
    assert_includes html, ">Active<"
  end

  test "renders as span" do
    doc = render_fragment Components::Badge.new(label: "Active")
    assert doc.at_css("span"), "Expected a span element"
  end

  test "default variant" do
    html = render_component Components::Badge.new(label: "Default")
    assert_includes html, "bg-gray-100"
    assert_includes html, "text-gray-800"
  end

  test "success variant" do
    html = render_component Components::Badge.new(label: "Done", variant: :success)
    assert_includes html, "bg-green-100"
    assert_includes html, "text-green-800"
  end

  test "danger variant" do
    html = render_component Components::Badge.new(label: "Error", variant: :danger)
    assert_includes html, "bg-red-100"
    assert_includes html, "text-red-800"
  end

  test "warning variant" do
    html = render_component Components::Badge.new(label: "Warn", variant: :warning)
    assert_includes html, "bg-yellow-100"
  end

  test "primary variant" do
    html = render_component Components::Badge.new(label: "New", variant: :primary)
    assert_includes html, "bg-blue-100"
  end

  test "wrong label type raises" do
    assert_raises(Literal::TypeError) { Components::Badge.new(label: 42) }
  end
end
