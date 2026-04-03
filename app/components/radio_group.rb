
class Components::RadioGroup < Components::FormField
  prop :options,     _Array(_Any)
  prop :selected,    _Nilable(String), default: -> { nil }
  prop :orientation, Symbol,           default: -> { :vertical }

  def view_template
    fieldset do
      legend(class: "block text-sm font-medium text-text mb-2") { @label } if @label
      div(class: option_wrapper_classes) do
        @options.each do |opt|
          label_text, value = opt.is_a?(Array) ? opt : [opt.to_s, opt.to_s]
          option_id = @form ? @form.field_id(@field, value) : "#{@field}_#{value}"

          label(for: option_id, class: "flex items-center gap-2 text-sm text-text cursor-pointer") do
            input(
              type:    "radio",
              id:      option_id,
              name:    field_name,
              value:   value,
              checked: value.to_s == @selected.to_s,
              class:   "w-4 h-4 border-border text-primary " \
                "focus:ring-primary focus:ring-offset-1 cursor-pointer"
            )
            plain label_text
          end
        end
      end
      p(class: "text-xs text-text-muted mt-1") { @hint } if @hint

      if @error
        msg = @error.strip.empty? ? "Please select an option." : @error
        p(class: "text-xs text-danger mt-1", role: "alert") { msg }
      end
    end
  end
  private

  def option_wrapper_classes
    @orientation == :horizontal ? "flex flex-wrap gap-4" : "space-y-2"
  end
end