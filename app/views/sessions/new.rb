# app/views/sessions/new.rb
class Views::Sessions::New < Views::Base
  def page_title = "Sign in to KanbanFlow"

  def around_template
    render Views::Layouts::AuthLayout.new(title: page_title) do
      view_template
    end
  end

  def view_template
    div(class: "flex items-center justify-center h-screen px-4") do
      div(class: "w-full max-w-md") do
        div(class: "text-center mb-8") do
          h1(class: "text-3xl font-bold text-text") { "KanbanFlow" }
          p(class: "text-text-muted mt-2") { "Sign in to your account" }
        end

        div(class: "bg-surface rounded-lg border border-border p-8 shadow-sm") do
          form_with(url: session_path, class: "space-y-4") do |f|
            TextInput(field: :email_address, label: "Email address", type: "email", placeholder: "you@example.com")
            TextInput(field: :password, label: "Password", type:  "password")

            div(class: "flex items-center justify-between gap-2") do
              Checkbox(field: :remember_me, label: "Remember me")
              Link(label: "Forgot password?", href: new_password_path)
            end

            Button(label: "Sign in", type: "submit")
          end

          div(class: "mt-6 text-center text-sm text-text-muted") do
            plain "Don't have an account? "
            Link(label: "Sign up", href: new_registration_path)
          end
        end
      end
    end
  end
end