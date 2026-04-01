# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
    render Views::Home::Index.new
  end

  def about
    render Views::Home::About.new(title: "About KanbanFlow")
  end
end
