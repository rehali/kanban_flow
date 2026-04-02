
class Components::RadioGroup < Components::Base
  prop :field,       Symbol
  prop :label,       _Nilable(String), default: -> { nil }
  prop :options,     _Array(_Any)
  prop :selected,    _Nilable(String), default: -> { nil }
  prop :hint,        _Nilable(String), default: -> { nil }
  prop :error,       _Boolean,         default: -> { false }
  prop :orientation, Symbol,           default: -> { :vertical }

  def view_template
    fieldset do
      legend(class: "block text-sm font-medium text-gray-700 mb-2") { @label } if @label
      div(class: option_wrapper_classes) do
        @options.each do |opt|
          label_text, value = opt.is_a?(Array) ? opt : [opt.to_s, opt.to_s]
          label(class: "flex items-center gap-2 text-sm text-gray-700 cursor-pointer") do
            input(
              type:    "radio",
              name:    @field,
              value:   value,
              checked: value.to_s == @selected.to_s,
              class:   "w-4 h-4 border-gray-300 text-blue-600 " \
                "focus:ring-blue-500 focus:ring-offset-1 cursor-pointer"
            )
            plain label_text
          end
        end
      end
      p(class: "text-xs text-gray-500 mt-1") { @hint } if @hint
      p(class: "text-xs text-red-600 mt-1",
        role:  "alert") { "Please select an option." } if @error
    end
  end

  private

  def option_wrapper_classes
    @orientation == :horizontal ? "flex flex-wrap gap-4" : "space-y-2"
  end
end