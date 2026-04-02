# app/components/text_area.rb
class Components::TextArea < Components::FormField
  prop :value,       _Nilable(String), default: -> { nil }
  prop :placeholder, _Nilable(String), default: -> { nil }
  prop :rows,        Integer,          default: 4
  private
  def render_input
    textarea(
      id:          @field,
      name:        @field,
      rows:        @rows,
      placeholder: @placeholder,
      required:    @required,
      class:       "#{input_classes} resize-y",
      aria:        aria_attrs
    ) { @value.to_s }
  end
end
