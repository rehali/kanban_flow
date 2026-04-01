# test/component_test_helper.rb
# frozen_string_literal: true

require "test_helper"
require "nokogiri"

module ComponentTestHelper
  def render_component(component)
    component.call
  end

  def render_fragment(component)
    Nokogiri::HTML5.fragment(render_component(component))
  end
end
