# app/views/passwords/new.rb

class Views::Passwords::New < Views::Base
  def page_title = "Reset your password"

  def around_template
    render Views::Layouts::AuthLayout.new(title: page_title) do
      view_template
    end
  end

  def view_template
    div(class: "flex items-center justify-center min-h-screen px-4") do
      div(class: "w-full max-w-md") do
        div(class: "bg-surface rounded-lg border border-border p-8 shadow-sm") do
          h1(class: "text-xl font-bold text-text mb-2") { "Reset your password" }
          p(class: "text-text-muted text-sm mb-6") { "Enter your email and we'll send you a reset link." }

          form_with(url: passwords_path, class: "space-y-4") do |f|
            TextInput(
              field:       :email_address,
              label:       "Email address",
              type:        "email",
              placeholder: "you@example.com"
            )

            Button(label: "Send reset link", type: "submit")
          end

          div(class: "mt-4 text-center") do
            Link(label: "← Back to sign in", href: new_session_path, variant: :secondary)
          end
        end
      end
    end
  end
end