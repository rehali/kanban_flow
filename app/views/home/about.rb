# app/views/home/about.rb
class Views::Home::About < Views::Base
  prop :title, String

  def view_template
    h1 { @title }   # try to use the instance variable
  end
end
