# app/components/theme_toggle.rb
# app/components/theme_toggle.rb — no controller, just the button
class Components::ThemeToggle < Components::Base
  def view_template
    button(
      type:  "button",
      class: "p-2 rounded-md text-text-muted hover:text-text " \
        "hover:bg-surface-alt transition-colors",
      data:  { action: "click->theme-toggle#toggle" }
    ) do
      span(data: { theme_toggle_target: "icon" }) { "🌙" }
    end
  end
end