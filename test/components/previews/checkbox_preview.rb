# test/components/previews/checkbox_preview.rb
class CheckboxPreview < Lookbook::Preview
  def unchecked
    render Components::Checkbox.new(
      field: :notifications,
      label: "Email notifications"
    )
  end

  def checked
    render Components::Checkbox.new(
      field:   :notifications,
      label:   "Email notifications",
      checked: true
    )
  end

  def with_hint
    render Components::Checkbox.new(
      field: :notifications,
      label: "Email notifications",
      hint:  "We'll only send important updates."
    )
  end
end
