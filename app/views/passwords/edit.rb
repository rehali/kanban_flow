# app/views/passwords/edit.rb
class Views::Passwords::Edit < Views::Base
  def page_title = "Set new password"

  def around_template
    render Views::Layouts::AuthLayout.new(title: page_title) do
      view_template
    end
  end

  def view_template
    div(class: "flex items-center justify-center h-screen px-4") do
      div(class: "w-full max-w-md") do
        div(class: "bg-surface rounded-lg border border-border p-8 shadow-sm") do
          h1(class: "text-xl font-bold text-text mb-6") { "Set new password" }

          form_with(url: password_path(params[:token]), method: :put,
                    class: "space-y-4") do |f|
            TextInput(field: :password, label: "New password", type:  "password")
            TextInput(field: :password_confirmation, label: "Confirm new password", type:  "password")
            Button(label: "Update password", type: "submit")
          end
        end
      end
    end
  end
end