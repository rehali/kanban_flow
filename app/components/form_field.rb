# app/components/form_field.rb
class Components::FormField < Components::Base
  prop :field,    Symbol
  prop :form,     _Nilable(_Any), default: -> { nil }
  prop :label,    _Nilable(String), default: -> { nil }
  prop :hint,     _Nilable(String), default: -> { nil }
  prop :error,    _Nilable(String), default: -> { nil }
  prop :required, _Boolean,         default: -> { false }

  def view_template
    div(class: "space-y-1") do
      render_label         if @label
      render_input
      render_error_message if show_error_message?
      render_hint          if @hint
    end
  end

  private

  def field_id
    @form ? @form.field_id(@field) : @field.to_s
  end

  def field_name
    @form ? @form.field_name(@field) : @field.to_s
  end

  def error?
    !@error.nil?
  end

  def show_error_message?
    error? && !@error.empty?
  end

  def render_label
    label(for: field_id, class: "block text-sm font-medium text-text") do
      plain @label
      abbr(title: "required", class: "ml-1 text-danger") { "*" } if @required
    end
  end

  def render_error_message
    p(class: "text-xs text-danger",
      id:    "#{@field}_error",
      role:  "alert") { @error }
  end

  def render_hint
    p(class: "text-xs text-text-muted") { @hint }
  end

  def render_input
    raise NotImplementedError, "#{self.class} must implement render_input"
  end

  def base_input_classes
    "w-full rounded-md border px-3 py-2 text-sm bg-surface " \
      "text-text placeholder:text-text-subtle " \
      "focus:outline-none focus:ring-2 focus:ring-offset-1"
  end

  def error_classes
    error? ? "border-danger focus:ring-danger"
      : "border-border focus:ring-primary"
  end

  def input_classes
    "#{base_input_classes} #{error_classes}"
  end

  def aria_attrs
    { invalid: error?.to_s }
  end
end