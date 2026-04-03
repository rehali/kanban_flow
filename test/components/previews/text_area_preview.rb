# test/components/previews/text_area_preview.rb
class TextAreaPreview < Lookbook::Preview
  def default
    render Components::TextArea.new(
      field:       :description,
      label:       "Description",
      placeholder: "Enter a description..."
    )
  end

  def with_value
    render Components::TextArea.new(
      field: :description,
      label: "Description",
      value: "This is an existing description that spans\nmultiple lines."
    )
  end

  def with_hint
    render Components::TextArea.new(
      field: :description,
      label: "Description",
      hint:  "Markdown is supported."
    )
  end

  def with_error
    render Components::TextArea.new(
      field: :description,
      label: "Description",
      error: "provide a description",
      value: ""
    )
  end

  def required
    render Components::TextArea.new(
      field:    :description,
      label:    "Description",
      required: true
    )
  end

  def no_label
    render Components::TextArea.new(
      field:       :description,
      placeholder: "Add a note...",
      rows:        3
    )
  end

  def tall
    render Components::TextArea.new(
      field: :description,
      label: "Description",
      rows:  8
    )
  end
end