# app/components/number_input.rb
class Components::NumberInput < Components::FormField
  prop :value, _Nilable(Integer), default: -> { nil }
  prop :min,   _Nilable(Integer), default: -> { nil }
  prop :max,   _Nilable(Integer), default: -> { nil }
  prop :step,  Integer,           default: 1

  private

  def render_input
    input(
      type:  "number",
      id:    field_id,
      name:  field_name,
      value: @value,
      min:   @min,
      max:   @max,
      step:  @step,
      class: input_classes,
      aria:  aria_attrs
    )
  end
end
