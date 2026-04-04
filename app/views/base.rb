# app/views/base.rb
# frozen_string_literal: true
class Views::Base < Components::Base
  def cache_store = Rails.cache

  def page_title
    self.class.name
        .sub("Views::", "")
        .gsub("::", " — ")
        .gsub(/([A-Z])/, ' \1')
        .strip
  end

  def around_template
    render Views::Layouts::AppLayout.new(title: page_title) do
      super
    end
  end
end
