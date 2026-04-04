# test/components/previews/toast_preview.rb
class ToastPreview < Lookbook::Preview
  layout "lookbook/preview"

  def info
    render Components::Toast.new(message: "Here is some information.", variant: :info, duration: 0)
  end

  def success
    render Components::Toast.new(message: "Board created successfully.", variant: :success, duration: 0)
  end

  def warning
    render Components::Toast.new(message: "Your session expires soon.", variant: :warning, duration: 0)
  end

  def danger
    render Components::Toast.new(message: "Something went wrong.", variant: :danger, duration: 0)
  end
end