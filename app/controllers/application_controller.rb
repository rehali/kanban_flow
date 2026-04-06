# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  include Authentication

  allow_browser versions: :modern
  stale_when_importmap_changes
  layout false

  private

  def current_user
    Current.session&.user
  end
  helper_method :current_user

  def policy_for(board)
    BoardPolicy.new(user: current_user, board: board)
  end

  def authorize!(policy_method, board)
    unless policy_for(board).public_send(policy_method)
      redirect_to boards_path, alert: "You don't have permission to do that."
    end
  end
end