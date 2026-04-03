# app/components/checkbox.rb
class Components::Checkbox < Components::FormField
  prop :checked, _Boolean, default: -> { false }
  prop :value, String, default: -> { "1" }

  def view_template
    div(class: "space-y-1") do
      label(class: "flex items-center gap-2 text-sm text-text cursor-pointer") do
        input(
          type:    "checkbox",
          id:      field_id,
          name:    field_name,
          value:   @value,
          checked: @checked,
          class:   "w-4 h-4 rounded border-border text-primary " \
            "focus:ring-primary focus:ring-offset-1 cursor-pointer"
        )
        plain @label if @label
      end
      p(class: "text-xs text-text-muted pl-6") { @hint } if @hint
    end
  end
end

