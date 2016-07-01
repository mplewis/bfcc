class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def ensure_user_logged_in
    redirect_to new_user_session_path, notice: 'You must be logged in to do that.' unless user_signed_in?
  end
end
