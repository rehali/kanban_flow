# test/components/previews/text_input_preview.rb
class TextInputPreview < Lookbook::Preview
  def default
    render Components::TextInput.new(
      field:       :name,
      label:       "Board name",
      placeholder: "e.g. Marketing Q3"
    )
  end

  def with_hint
    render Components::TextInput.new(
      field: :name,
      label: "Board name",
      hint:  "Choose a short, descriptive name."
    )
  end

  def with_error
    render Components::TextInput.new(
      field: :name,
      label: "Board name",
      error: true,
      value: ""
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
