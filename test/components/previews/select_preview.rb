# test/components/previews/select_preview.rb
class SelectPreview < Lookbook::Preview
  def default
    render Components::Select.new(
      field:   :role,
      label:   "Role",
      options: [["Administrator", "admin"], ["Member", "member"]],
      prompt:  "Select a role"
    )
  end

  def with_selection
    render Components::Select.new(
      field:    :role,
      label:    "Role",
      options:  [["Administrator", "admin"], ["Member", "member"]],
      selected: "member"
    )
  end

  def with_error
    render Components::Select.new(
      field:   :role,
      label:   "Role",
      options: [["Administrator", "admin"], ["Member", "member"]],
      prompt:  "Select a role",
      error:   true
    )
  end
end
