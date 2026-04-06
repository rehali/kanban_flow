# app/controllers/registrations_controller.rb
class RegistrationsController < ApplicationController
  allow_unauthenticated_access

  def new
    render Views::Registrations::New.new(user: User.new)
  end

  def create
    user = User.new(registration_params)
    if user.save
      start_new_session_for(user)
      redirect_to boards_path, notice: "Welcome to KanbanFlow!"
    else
      render Views::Registrations::New.new(user: user),
             status: :unprocessable_entity
    end
  end

  private

  def registration_params
    params.expect(user: [:name, :email_address, :password,
                         :password_confirmation])
  end
end