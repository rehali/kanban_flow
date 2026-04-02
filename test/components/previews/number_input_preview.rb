# test/components/previews/number_input_preview.rb
class NumberInputPreview < Lookbook::Preview
  def default
    render Components::NumberInput.new(
      field: :quantity,
      label: "Quantity"
    )
  end

  def with_value
    render Components::NumberInput.new(
      field: :quantity,
      label: "Quantity",
      value: 5
    )
  end

  def with_min_max
    render Components::NumberInput.new(
      field: :position,
      label: "Position",
      value: 1,
      min:   1,
      max:   10
    )
  end

  def with_step
    render Components::NumberInput.new(
      field: :price,
      label: "Price",
      value: 9,
      min:   0,
      step:  3
    )
  end

  def with_hint
    render Components::NumberInput.new(
      field: :quantity,
      label: "Quantity",
      hint:  "Must be between 1 and 100.",
      min:   1,
      max:   100
    )
  end

  def with_error
    render Components::NumberInput.new(
      field: :quantity,
      label: "Quantity",
      error: true,
      value: 0
    )
  end

  def no_label
    render Components::NumberInput.new(
      field: :count,
      min:   0
    )
  end
end