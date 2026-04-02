# test/view_test_helper.rb
#
# Use this helper for testing Views:: classes and any app-specific
# component that uses Rails infrastructure (route helpers, form_with,
# dom_id etc.)
#
# Usage:
#   class Views::Boards::IndexTest < ActiveSupport::TestCase
#     include ViewTestHelper
#   end
#
require "test_helper"
require "nokogiri"

module ViewTestHelper
  # Route helpers — boards_path, new_board_path, board_path(@board) etc.
  # Also makes them available directly in test assertions.
  include Rails.application.routes.url_helpers

  # Required by url_helpers when called outside a request context.
  def default_url_options
    { host: "localhost" }
  end

  # Render a view or component through Rails' own rendering pipeline,
  # giving it a full view context — csrf_meta_tags, stylesheet_link_tag,
  # turbo helpers etc. all work correctly.
  def render_view(view)
    view_context.render(view)
  end

  # Same as render_view but returns a parsed Nokogiri fragment
  # for DOM assertions: doc.at_css("h1"), doc.css("li") etc.
  def render_view_fragment(view)
    Nokogiri::HTML5.fragment(render_view(view))
  end

  # Stub current_user for views that use it.
  # Override in your test with:
  #   def current_user = User.new(name: "Alice", email: "alice@example.com")
  def current_user
    nil
  end

  private

  # Rails' purpose-built test controller — provides a minimal but
  # complete Rails context without needing a real request or routing.
  def controller
    @controller ||= ActionView::TestCase::TestController.new
  end

  # Memoised view context derived from the test controller.
  # All Rails view helpers are available through this context.
  def view_context
    @view_context ||= controller.view_context
  end
end