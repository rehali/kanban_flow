class RadioGroupPreview < Lookbook::Preview
  def default
    render Components::RadioGroup.new(
      field:   :role,
      label:   "Role",
      options: [["Administrator", "admin"], ["Member", "member"]]
    )
  end

  def flat_options
    render Components::RadioGroup.new(
      field:   :status,
      label:   "Status",
      options: ["Active", "Inactive"]
    )
  end

  def horizontal
    render Components::RadioGroup.new(
      field:       :priority,
      label:       "Priority",
      options:     ["Low", "Medium", "High"],
      selected:    "Medium",
      orientation: :horizontal
    )
  end

  def with_selection
    render Components::RadioGroup.new(
      field:    :role,
      label:    "Role",
      options:  [["Administrator", "admin"], ["Member", "member"]],
      selected: "member"
    )
  end

  def with_hint
    render Components::RadioGroup.new(
      field:   :role,
      label:   "Role",
      options: [["Administrator", "admin"], ["Member", "member"]],
      hint:    "Administrators can manage members and delete the board."
    )
  end

  def with_error_message
    render Components::RadioGroup.new(
      field:   :role,
      label:   "Role",
      options: [["Administrator", "admin"], ["Member", "member"]],
      error:   "No role selected"
    )
  end

  def with_error
    render Components::RadioGroup.new(
      field:   :role,
      label:   "Role",
      options: [["Administrator", "admin"], ["Member", "member"]],
      error:   ""
    )
  end

end