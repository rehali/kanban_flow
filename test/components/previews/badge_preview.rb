# test/components/previews/badge_preview.rb
class BadgePreview < Lookbook::Preview
  def default    = render Components::Badge.new(label: "Default")
  def primary    = render Components::Badge.new(label: "Primary",  variant: :primary)
  def success    = render Components::Badge.new(label: "Success",  variant: :success)
  def warning    = render Components::Badge.new(label: "Warning",  variant: :warning)
  def danger     = render Components::Badge.new(label: "Danger",   variant: :danger)
end
