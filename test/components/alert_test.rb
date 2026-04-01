# frozen_string_literal: true

require_relative "../component_test_helper"

class AlertTest < ActiveSupport::TestCase
  include ComponentTestHelper

  test "has role alert" do
    doc = render_fragment Components::Alert.new(message: "Hello")
    assert doc.at_css("[role=alert]"), "Expected role=alert"
  end

  test "renders message" do
    html = render_component Components::Alert.new(message: "Something happened")
    assert_includes html, "Something happened"
  end

  test "info variant has blue background" do
    html = render_component Components::Alert.new(message: "Info", variant: :info)
    assert_includes html, "bg-blue-50"
    assert_includes html, "border-blue-200"
    assert_includes html, "text-blue-800"
  end

  test "success variant has green background" do
    html = render_component Components::Alert.new(message: "OK", variant: :success)
    assert_includes html, "bg-green-50"
  end

  test "warning variant has yellow background" do
    html = render_component Components::Alert.new(message: "Warning", variant: :warning)
    assert_includes html, "bg-yellow-50"
  end

  test "danger variant has red background" do
    html = render_component Components::Alert.new(message: "Error", variant: :danger)
    assert_includes html, "bg-red-50"
  end

  test "dismissible shows button" do
    doc = render_fragment Components::Alert.new(message: "Hello", dismissible: true)
    assert doc.at_css("button"), "Expected dismiss button"
  end

  test "not dismissible hides button" do
    doc = render_fragment Components::Alert.new(message: "Hello")
    assert_nil doc.at_css("button"), "Expected no dismiss button"
  end

  test "wrong message type raises" do
    assert_raises(Literal::TypeError) { Components::Alert.new(message: 42) }
  end
end
