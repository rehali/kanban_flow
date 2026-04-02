# test/components/previews/heading_preview.rb
class HeadingPreview < Lookbook::Preview
  def h1 = render Components::Heading.new(text: "Heading level 1", level: 1)
  def h2 = render Components::Heading.new(text: "Heading level 2", level: 2)
  def h3 = render Components::Heading.new(text: "Heading level 3", level: 3)
  def h4 = render Components::Heading.new(text: "Heading level 4", level: 4)
end
