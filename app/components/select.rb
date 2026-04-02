# app/components/select.rb
class Components::Select < Components::FormField
  prop :options,  _Array(_Any)
  prop :selected, _Nilable(String), default: -> { nil }
  prop :prompt,   _Nilable(String), default: -> { nil }

  private

  def render_input
    div(class: "relative") do
      select(
        id:       @field,
        name:     @field,
        required: @required,
        class:    "#{input_classes} appearance-none pr-8",
        aria:     aria_attrs
      ) do
        if @prompt
          option(value: "", disabled: true, selected: @selected.nil?) { @prompt }
        end
        @options.each do |opt|
          label, value = opt.is_a?(Array) ? opt : [opt.to_s, opt.to_s]
          option(value: value, selected: value.to_s == @selected.to_s) { label }
        end
      end

      div(class: "pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-400") do
        span(class: "text-lg rotate-90 inline-block leading-none") { "›" }
      end
    end
  end
end
