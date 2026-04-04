# app/components/dropdown.rb
class Components::Dropdown < Components::Base
  prop :label, String
  prop :align, Symbol, default: -> { :left }

  def view_template(&)
    vanish(&)

    div(
      class: "relative inline-block",
      data:  { controller: "dropdown" }
    ) do
      render_trigger
      render_menu
    end
  end

  def item(label, url: "#", method: :get, **attrs)
    @items ||= []
    @items << { label:, url:, method:, attrs: }
    nil
  end

  private

  def render_trigger
    button(
      type:  "button",
      class: "inline-flex items-center gap-1 px-3 py-2 text-sm " \
        "font-medium text-text rounded-md hover:bg-surface-alt",
      data:  {
        action:           "click->dropdown#toggle " \
          "click@window->dropdown#closeOnOutsideClick",
        dropdown_target:  "trigger",
        aria_expanded:    "false",
        aria_haspopup:    "true"
      }
    ) do
      plain @label
      span(class: "text-text-muted") { "▾" }
    end
  end

  def render_menu
    div(
      role:   "menu",
      class:  menu_classes,
      hidden: true,
      data:   { dropdown_target: "menu" }
    ) do
      (@items || []).each { |item| render_item(item) }
    end
  end

  def render_item(item)
    if item[:method] == :delete
      form_with(url: item[:url], method: :delete) do
        button(type: "submit", role: "menuitem", class: item_classes) { item[:label] }
      end
    else
      a(href: item[:url], role: "menuitem", class: item_classes) { item[:label] }
    end
  end

  def menu_classes
    base = "absolute z-10 mt-1 w-48 bg-surface rounded-md shadow-lg " \
      "border border-border py-1"
    @align == :right ? "#{base} right-0" : "#{base} left-0"
  end

  def item_classes
    "block w-full text-left px-4 py-2 text-sm text-text " \
      "hover:bg-surface-alt focus:outline-none focus:bg-surface-alt"
  end
end