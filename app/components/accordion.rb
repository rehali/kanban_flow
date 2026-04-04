# app/components/accordion.rb
class Components::Accordion < Components::Base
  prop :multiple, _Boolean, default: -> { false }

  def after_initialize
    @panels = []
  end

  def view_template(&)
    vanish(&)

    div(
      class: "divide-y divide-border rounded-lg border border-border",
      data:  { controller: "accordion", accordion_multiple_value: @multiple }
    ) do
      @panels.each_with_index { |panel, index| render_panel(panel, index) }
    end
  end

  def panel(title:, open: false, &content)
    @panels << { title:, open:, content: capture(&content) }
    nil
  end

  private

  def render_panel(panel, index)
    div(data: { accordion_target: "panel" }) do
      button(
        type:  "button",
        class: "flex w-full items-center justify-between px-4 py-3 " \
          "text-left text-sm font-medium text-text hover:bg-surface-alt",
        data:  {
          action:           "click->accordion#toggle",
          accordion_target: "trigger",
        },
        aria:  { expanded: panel[:open].to_s }
      ) do
        span { panel[:title] }
        span(
          class: "transition-transform duration-200",
          data:  { accordion_target: "icon" }
        ) { "▾" }
      end

      div(
        class:  "overflow-hidden transition-all duration-200",
        hidden: !panel[:open],
        data:   { accordion_target: "content" }
      ) do
        div(class: "px-4 py-3 text-sm text-text-muted") { raw safe(panel[:content]) }
      end
    end
  end
end