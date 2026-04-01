# app/views/base.rb
# frozen_string_literal: true
class Views::Base < Components::Base
  def cache_store = Rails.cache

  def page_title = "KanbanFlow"

  def around_template
    render Components::Layouts::AppLayout.new(title: page_title) do
      super
    end
  end
end
