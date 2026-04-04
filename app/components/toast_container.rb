# app/components/toast_container.rb
class Components::ToastContainer < Components::Base
  def view_template
    div(
      id:    "toast-container",
      class: "fixed bottom-4 right-4 z-50 flex flex-col gap-2 pointer-events-none",
      data:  { controller: "toast-container", turbo_permanent: true },
      aria:  { live: "polite", atomic: false }
    )
  end
end