# frozen_string_literal: true

require_relative "../component_test_helper"

class AvatarTest < ActiveSupport::TestCase
  include ComponentTestHelper

  test "shows initials without image" do
    html = render_component Components::Avatar.new(name: "Alice Smith")
    assert_includes html, "AS"
  end

  test "single name shows one initial" do
    html = render_component Components::Avatar.new(name: "Alice")
    assert_includes html, "A"
  end

  test "initials are uppercase" do
    html = render_component Components::Avatar.new(name: "bob jones")
    assert_includes html, "BJ"
  end

  test "renders image when url provided" do
    doc = render_fragment Components::Avatar.new(
      name:      "Alice Smith",
      image_url: "/alice.jpg"
    )
    assert doc.at_css("img"), "Expected an img element"
    assert_equal "/alice.jpg", doc.at_css("img")["src"]
    assert_equal "Alice Smith", doc.at_css("img")["alt"]
  end

  test "small size applies correct classes" do
    html = render_component Components::Avatar.new(name: "Alice", size: :sm)
    assert_includes html, "h-8"
    assert_includes html, "w-8"
  end

  test "large size applies correct classes" do
    html = render_component Components::Avatar.new(name: "Alice", size: :lg)
    assert_includes html, "h-12"
    assert_includes html, "w-12"
  end

  test "wrong name type raises" do
    assert_raises(Literal::TypeError) { Components::Avatar.new(name: 42) }
  end
end
