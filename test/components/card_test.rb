# frozen_string_literal: true

require_relative "../component_test_helper"

class CardTest < ActiveSupport::TestCase
  include ComponentTestHelper

  test "renders article element" do
    doc = render_fragment Components::Card.new
    assert doc.at_css("article"), "Expected an article element"
  end

  test "renders title prop in header" do
    doc = render_fragment Components::Card.new(title: "Hello")
    assert_includes doc.at_css(".card-header").text, "Hello"
  end

  test "no header rendered without title or header slot" do
    doc = render_fragment Components::Card.new
    assert_nil doc.at_css(".card-header"), "Expected no header"
  end

  test "header slot renders" do
    html = Components::Card.new.call do |card|
      card.header { "Slot header" }
    end
    assert_includes html, "Slot header"
    assert_includes html, "card-header"
  end

  test "body slot renders" do
    html = Components::Card.new.call do |card|
      card.body { "Body content" }
    end
    assert_includes html, "Body content"
    assert_includes html, "card-body"
  end

  test "footer slot renders" do
    html = Components::Card.new.call do |card|
      card.footer { "Footer content" }
    end
    assert_includes html, "Footer content"
    assert_includes html, "card-footer"
  end

  test "no footer without footer slot" do
    doc = render_fragment Components::Card.new(title: "Hello")
    assert_nil doc.at_css(".card-footer"), "Expected no footer"
  end

  test "all slots render together" do
    html = Components::Card.new.call do |card|
      card.header { "My header" }
      card.body   { "My body"   }
      card.footer { "My footer" }
    end
    assert_includes html, "My header"
    assert_includes html, "My body"
    assert_includes html, "My footer"
  end

  test "wrong title type raises" do
    assert_raises(Literal::TypeError) { Components::Card.new(title: 42) }
  end
end
