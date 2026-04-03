# test/components/previews/button_preview.rb
class ButtonPreview < Lookbook::Preview
  # Primary navigation link
  def default
    render Components::Button.new(label: "New Board", href: "#")
  end

  def secondary
    render Components::Button.new(label: "Secondary", href: "#", variant: :secondary)
  end

  def outline
    render Components::Button.new(label: "Cancel", href: "#", variant: :outline)
  end

  def danger_link
    render Components::Button.new(label: "Delete board", href: "#",
                                  variant: :danger,
                                  data: { turbo_method: :delete,
                                          turbo_confirm: "Are you sure?" })
  end

  def submit
    render Components::Button.new(label: "Create board", type: "submit")
  end

  def stimulus_trigger
    render Components::Button.new(label: "Open modal", type: "button",
                                  data: { action: "click->modal#open" })
  end

  def disabled
    render Components::Button.new(label: "Unavailable", type: "submit",
                                  disabled: true)
  end

  def small
    render Components::Button.new(label: "Small", href: "#", size: :sm)
  end

  def large
    render Components::Button.new(label: "Large", href: "#", size: :lg)
  end

  # @param label text
  # @param variant select { choices: [primary, secondary, danger, outline] }
  # @param size select { choices: [sm, md, lg] }
  def interactive(label: "Click me", variant: :primary, size: :md)
    render Components::Button.new(
      label:   label.to_s.strip.empty? ? "Click me" : label,
      variant: variant.to_sym,
      size:    size.to_sym,
      href:    "#"
    )
  end
end