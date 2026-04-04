# test/components/previews/icon_preview.rb
class IconPreview < Lookbook::Preview
  def information_circle = render Components::Icon.new(name: :information_circle)
  def check_circle       = render Components::Icon.new(name: :check_circle)
  def exclamation_triangle = render Components::Icon.new(name: :exclamation_triangle)
  def x_circle           = render Components::Icon.new(name: :x_circle)
  def x_mark             = render Components::Icon.new(name: :x_mark)

  def small
    render Components::Icon.new(name: :check_circle, class_name: "h-4 w-4")
  end

  def large
    render Components::Icon.new(name: :check_circle, class_name: "h-8 w-8")
  end

  # @param name select { choices: [information_circle, check_circle, exclamation_triangle, x_circle, x_mark] }
  # @param size select { choices: [sm, md, lg] }
  def interactive(name: :check_circle, size: :md)
    size_class = { sm: "h-4 w-4", md: "h-6 w-6", lg: "h-8 w-8" }.fetch(size.to_sym)
    render Components::Icon.new(name: name.to_sym, class_name: size_class)
  end
end