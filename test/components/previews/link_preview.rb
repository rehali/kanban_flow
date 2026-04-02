# test/components/previews/link_preview.rb
class LinkPreview < Lookbook::Preview
  def default   = render Components::Link.new(label: "Default link",   href: "#")
  def secondary = render Components::Link.new(label: "Secondary link", href: "#", variant: :secondary)
  def button    = render Components::Link.new(label: "Button link",    href: "#", variant: :button)
end
