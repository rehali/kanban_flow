# test/components/previews/alert_preview.rb
class AlertPreview < Lookbook::Preview
  def info
    render Components::Alert.new(message: "This is an info message.", variant: :info)
  end
  def success
    render Components::Alert.new(message: "Operation successful.", variant: :success)
  end
  def warning
    render Components::Alert.new(message: "Please review your input.", variant: :warning)
  end
  def danger
    render Components::Alert.new(message: "Something went wrong.", variant: :danger)
  end
  def dismissible
    render Components::Alert.new(
      message:     "This alert can be dismissed.",
      variant:     :info,
      dismissible: true
    )
  end
end
