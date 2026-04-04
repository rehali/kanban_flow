# test/components/previews/modal_preview.rb
# test/components/previews/modal_preview.rb
class ModalPreview < Lookbook::Preview
  layout "lookbook/preview"

  class WithFooter < Components::Base
    def view_template
      Modal(title: "Confirm Action", open: true) do |m|
        m.body do
          p { "Are you sure you want to continue? This cannot be undone." }
        end
        m.footer do
          div(class: "flex gap-3 justify-end") do
            Button(label: "Cancel",  variant: :outline, type: "button",
                   data: { action: "click->modal#close" })
            Button(label: "Confirm", variant: :danger,  type: "button")
          end
        end
      end
    end
  end

  def default
    render Components::Modal.new(title: "Example Modal", open: true) { |m|
      m.body { }
    }
  end

  def with_footer
    render WithFooter.new
  end
end