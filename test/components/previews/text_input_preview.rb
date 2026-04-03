# test/components/previews/text_input_preview.rb
class TextInputPreview < Lookbook::Preview
  def default
    render Components::TextInput.new(
      field:       :name,
      label:       "Board name",
      placeholder: "e.g. Marketing Q3"
    )
  end

  def with_value
    render Components::TextInput.new(
      field: :name,
      label: "Board name",
      value: "KanbanFlow"
    )
  end

  def with_hint
    render Components::TextInput.new(
      field: :name,
      label: "Board name",
      hint:  "Choose a short, descriptive name."
    )
  end

  # error: nil — no error, normal styling
  def no_error
    render Components::TextInput.new(
      field: :name,
      label: "Board name",
      error: nil
    )
  end

  # error: "" — red border only, no message
  # use this when ErrorSummary handles the message at the top of the form
  def error_highlight_only
    render Components::TextInput.new(
      field: :name,
      label: "Board name",
      value: "",
      error: ""
    )
  end

  # error: "message" — red border plus inline message
  def error_with_message
    render Components::TextInput.new(
      field: :name,
      label: "Board name",
      value: "",
      error: "can't be blank"
    )
  end

  def required
    render Components::TextInput.new(
      field:    :name,
      label:    "Board name",
      required: true
    )
  end

  def password
    render Components::TextInput.new(
      field: :password,
      label: "Password",
      type:  "password"
    )
  end

  def no_label
    render Components::TextInput.new(
      field:       :search,
      placeholder: "Search..."
    )
  end
end