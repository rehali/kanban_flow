class Components::ThemeSelector < Components::Base
  THEMES = [
    { id: "default", label: "Default", icon: "💧" },
    { id: "forest",  label: "Forest",  icon: "🌲" },
    { id: "ember",   label: "Ember",   icon: "🔥" },
  ].freeze

  def view_template
    div(
      class: "relative",
    ) do
      button(
        type:  "button",
        class: "flex items-center gap-2 px-3 py-2 text-sm rounded-md " \
          "text-text-muted hover:text-text hover:bg-surface-alt " \
          "transition-colors",
        data:  { action: "click->theme-toggle#toggleDropdown" }
      ) do
        span(data: { theme_toggle_target: "currentIcon" }) { "💧" }
        span(data: { theme_toggle_target: "currentLabel" },
             class: "hidden sm:inline") { "Default" }
        span(class: "text-xs") { "▾" }
      end

      div(
        class:  "absolute right-0 mt-1 w-40 bg-surface border border-border " \
          "rounded-md shadow-lg py-1 z-50",
        hidden: true,
        data:   { theme_toggle_target: "dropdown" }
      ) do
        THEMES.each do |theme|
          button(
            type:  "button",
            class: "flex items-center gap-2 w-full px-4 py-2 text-sm " \
              "text-text hover:bg-surface-alt transition-colors",
            data:  {
              action:              "click->theme-toggle#selectTheme",
              theme_toggle_target: "themeOption",
              theme_id:            theme[:id]
            }
          ) do
            span { theme[:icon] }
            plain theme[:label]
          end
        end
      end
    end
  end
end