class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user, :user_signed_in?, :require_no_user, :require_current_user

  private
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id].present?
  end

  def user_signed_in?
    current_user.present?
  end

  def require_no_user
    return if !user_signed_in?
    redirect_to root_path
  end

  def require_current_user
    return if !user_signed_in?
    redirect_to root_path
  end
end
