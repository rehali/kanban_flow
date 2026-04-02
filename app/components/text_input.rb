# app/components/text_input.rb
class Components::TextInput < Components::FormField
  prop :value,       _Nilable(String), default: -> { nil }
  prop :placeholder, _Nilable(String), default: -> { nil }
  prop :type,        String,           default: -> { "text" }

  private

  def render_input
    input(
      type:        @type,
      id:          @field,
      name:        @field,
      value:       @value.to_s,
      placeholder: @placeholder,
      required:    @required,
      class:       input_classes,
      aria:        aria_attrs
    )
  end
end
