# frozen_string_literal: true

class Components::Base < Phlex::HTML
  include Phlex::Rails::Helpers::Routes
  extend Literal::Properties

  private

  def class_names(*classes)
    classes.flatten.compact.reject(&:empty?).join(" ")
  end
end
