# test/components/breadcrumb_test.rb
require "test_helper"
require "component_test_helper"
class BreadcrumbTest < ActiveSupport::TestCase
  include ComponentTestHelper
  test "renders nav with aria label" do
    doc = render_fragment Components::Breadcrumb.new { |b|
      b.item "Home",   url: "/"
      b.item "Boards", url: "/boards"
      b.item "My Board"
    }
    assert doc.at_css("nav[aria-label='Breadcrumb']"),
           "Expected nav with aria-label='Breadcrumb'"
  end
  test "last item renders as text not link" do
    doc = render_fragment Components::Breadcrumb.new { |b|
      b.item "Boards", url: "/boards"
      b.item "My Board"
    }
    assert_nil doc.css("li").last.at_css("a"),
               "Expected last item to have no link"
    assert_includes doc.css("li").last.text, "My Board"
  end
  test "all items except last render as links" do
    doc = render_fragment Components::Breadcrumb.new { |b|
      b.item "Home",   url: "/"
      b.item "Boards", url: "/boards"
      b.item "My Board"
    }
    items = doc.css("li")
    assert items.first.at_css("a"), "Expected first item to be a link"
    assert items[1].at_css("a"),    "Expected second item to be a link"
    assert_nil items.last.at_css("a"),
               "Expected last item not to be a link"
  end
  test "three items render three li elements" do
    doc = render_fragment Components::Breadcrumb.new { |b|
      b.item "Home",   url: "/"
      b.item "Boards", url: "/boards"
      b.item "My Board"
    }
    assert_equal 3, doc.css("li").count
  end
end
