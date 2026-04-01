# app/controllers/home_controller.rb
class HomeController < ApplicationController

  def index
    render Views::Home::Index.new
  end
end
