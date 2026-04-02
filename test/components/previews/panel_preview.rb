# test/components/previews/panel_preview.rb
class PanelPreview < Lookbook::Preview
  def default
    render Components::Panel.new(title: "Panel title") {
      p { "Panel body content." }
    }
  end
end
