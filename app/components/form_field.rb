# app/components/form_field.rb
class Components::FormField < Components::Base
  prop :field,    Symbol
  prop :label,    _Nilable(String), default: -> { nil }
  prop :hint,     _Nilable(String), default: -> { nil }
  prop :error,    _Boolean,         default: -> { false }
  prop :required, _Boolean,         default: -> { false }

  def view_template
    div(class: "space-y-1") do
      render_label if @label
      render_input
      render_hint  if @hint
    end
  end

  private

  def render_label
    label(for: @field, class: "block text-sm font-medium text-gray-700") do
      plain @label
      abbr(title: "required", class: "ml-1 text-red-500") { "*" } if @required
    end
  end

  def render_hint
    p(class: "text-xs text-gray-500") { @hint }
  end

  def render_input
    raise NotImplementedError, "#{self.class} must implement render_input"
  end

  def base_input_classes
    "w-full rounded-md border px-3 py-2 text-sm bg-white " \
      "text-gray-900 placeholder:text-gray-400 " \
      "focus:outline-none focus:ring-2 focus:ring-offset-1"
  end

  def error_classes
    @error ? "border-red-300 focus:ring-red-500"
      : "border-gray-300 focus:ring-blue-500"
  end

  def input_classes
    "#{base_input_classes} #{error_classes}"
  end

  def aria_attrs
    { invalid: @error.to_s }
  end
end
