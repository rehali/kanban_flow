# frozen_string_literal: true

class Components::Base < Phlex::HTML
  include Phlex::Rails::Helpers::Routes
  include Phlex::Rails::Helpers::FormWith
  include Phlex::Rails::Helpers::DOMID

  register_value_helper :flash

  extend Literal::Properties

  private

  def class_names(*classes)
    classes.flatten.compact.reject(&:empty?).join(" ")
  end
end
