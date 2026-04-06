# app/views/registrations/new.rb
class Views::Registrations::New < Views::Base
  prop :user, ::User

  def page_title = "Create your account"

  def around_template
    render Views::Layouts::AuthLayout.new(title: page_title) do
      view_template
    end
  end

  def view_template
    div(class: "flex items-center justify-center h-screen px-4") do
      div(class: "w-full max-w-md") do
        div(class: "bg-surface rounded-lg border border-border p-8 shadow-sm") do
          h1(class: "text-xl font-bold text-text mb-6") do
            plain "Create your account"
          end

          form_with(model: @user, url: registration_path,
                    class: "space-y-4") do |f|
            TextInput(
              form:        f,
              field:       :name,
              label:       "Your name",
              value:       @user.name.to_s,
              placeholder: "Alice Smith",
              error:       @user.errors[:name].first
            )

            TextInput(
              form:        f,
              field:       :email_address,
              label:       "Email address",
              type:        "email",
              value:       @user.email_address.to_s,
              placeholder: "you@example.com",
              error:       @user.errors[:email_address].first
            )

            TextInput(
              form:        f,
              field:       :password,
              label:       "Password",
              type:        "password",
              error:       @user.errors[:password].first
            )

            TextInput(
              form:        f,
              field:       :password_confirmation,
              label:       "Confirm password",
              type:        "password"
            )

            Button(label: "Create account", type: "submit")
          end

          div(class: "mt-6 text-center text-sm text-text-muted") do
            plain "Already have an account? "
            a(href: new_session_path,
              class: "text-primary hover:text-primary-hover") do
              plain "Sign in"
            end
          end
        end
      end
    end
  end
end