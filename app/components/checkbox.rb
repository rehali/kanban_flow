# app/components/checkbox.rb
class Components::Checkbox < Components::FormField
  prop :checked, _Boolean, default: -> { false }
  prop :value, String, default: -> { "1" }

  def view_template
    div(class: "space-y-1") do
      input(
        type: "checkbox",
        id: @field,
        name: @field,
        value: @value,
        checked: @checked,
        class: "w-4 h-4 mr-2 rounded border-gray-300 text-blue-600 " \
          "focus:ring-blue-500 focus:ring-offset-1 cursor-pointer"
      )
      plain @label if @label
    end
    p(class: "text-xs text-gray-500 pl-6") { @hint } if @hint
  end
end

