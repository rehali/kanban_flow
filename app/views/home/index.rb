# app/views/home/index.rb
class Views::Home::Index < Views::Base
  def page_title = "Welcome"

  def view_template
    h1(class: "text-2xl font-bold") { "Welcome to KanbanFlow" }
  end
end
