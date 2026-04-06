class ApplicationController < ActionController::Base
  include Authentication
  #include ToastHelper
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  layout false

  def current_user
    Current.session&.user
  end
  helper_method :current_user
end
