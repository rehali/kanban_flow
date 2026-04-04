# app/components/tabs.rb
class Components::Tabs < Components::Base
  def after_initialize
    @tabs = []
  end

  def view_template(&)
    vanish(&)
    div(data: { controller: "tabs" }) do
      render_tab_list
      render_panels
    end
  end

  def tab(label, &content)
    @tabs << { label:, content: capture(&content) }
    nil
  end

  private

  def render_tab_list
    div(role: "tablist", class: "flex border-b border-border") do
      @tabs.each_with_index do |tab, index|
        button(
          type:  "button",
          role:  "tab",
          id:    "tab-#{index}",
          class: tab_button_classes(index),
          data:  {
            action:      "click->tabs#select",
            tabs_target: "trigger",
            index:       index
          },
          aria:  { selected: (index == 0).to_s, controls: "panel-#{index}" }
        ) { tab[:label] }
      end
    end
  end

  def render_panels
    @tabs.each_with_index do |tab, index|
      div(
        id:     "panel-#{index}",
        role:   "tabpanel",
        hidden: index != 0,
        class:  "py-4",
        data:   { tabs_target: "panel" },
        aria:   { labelledby: "tab-#{index}" }
      ) { raw safe(tab[:content]) }
    end
  end

  def tab_button_classes(index)
    base = "px-4 py-2 text-sm font-medium border-b-2 -mb-px transition-colors"
    index == 0 ? "#{base} border-primary text-primary"
      : "#{base} border-transparent text-text-muted hover:text-text"
  end
end