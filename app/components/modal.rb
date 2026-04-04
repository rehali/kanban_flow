# app/components/modal.rb
class Components::Modal < Components::Base
  prop :title, String
  prop :open,  _Boolean, default: -> { false }

  def view_template(&)
    vanish(&)

    div(
      class: "relative z-50",
      data:  {
        controller:       "modal",
        modal_open_value: @open
      }
    ) do
      render_backdrop
      render_panel
    end
  end

  def trigger(&) = @trigger = capture(&)
  def body(&)    = @body    = capture(&)
  def footer(&)  = @footer  = capture(&)

  private

  def render_backdrop
    div(
      class: "fixed inset-0 bg-black/50 transition-opacity",
      data:  { modal_target: "backdrop", action: "click->modal#close" }
    )
  end

  def render_panel
    div(
      role:  "dialog",
      aria:  { modal: true, labelledby: "modal-title" },
      class: "fixed inset-0 flex items-center justify-center p-4",
      data:  { modal_target: "panel" }
    ) do
      div(class: "bg-surface rounded-lg shadow-xl w-full max-w-md") do
        render_header
        div(class: "px-6 py-4") { raw safe(@body) }           if @body
        div(class: "px-6 py-4 border-t border-border") { raw safe(@footer) } if @footer
      end
    end
  end

  def render_header
    div(class: "flex items-center justify-between px-6 py-4 border-b border-border") do
      h2(id: "modal-title", class: "font-semibold text-text") { @title }
      button(
        type:  "button",
        class: "text-text-muted hover:text-text",
        data:  { action: "click->modal#close" },
        aria:  { label: "Close" }
      ) { "×" }
    end
  end
end