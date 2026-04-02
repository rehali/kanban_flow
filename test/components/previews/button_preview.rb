# test/components/previews/button_preview.rb
class ButtonPreview < Lookbook::Preview
  layout "lookbook/preview"

  def default
    render Components::Button.new(label: "Click me")
  end
  def primary
    render Components::Button.new(label: "Primary", variant: :primary)
  end
  def secondary
    render Components::Button.new(label: "Secondary", variant: :secondary)
  end
  def danger
    render Components::Button.new(label: "Delete", variant: :danger)
  end
  def ghost
    render Components::Button.new(label: "Skip", variant: :ghost)
  end
  def disabled
    render Components::Button.new(label: "Disabled", disabled: true)
  end
  def small
    render Components::Button.new(label: "Small", size: :sm)
  end
  def large
    render Components::Button.new(label: "Large", size: :lg)
  end

  # @param variant select { choices: [primary, secondary, danger, ghost] }
  # @param label text
  # @param disabled toggle
  def interactive(variant: :primary, label: "Click me", disabled: false)
    render Components::Button.new(
      label:    label,
      variant:  variant.to_sym,
      disabled: disabled
    )
  end
end
