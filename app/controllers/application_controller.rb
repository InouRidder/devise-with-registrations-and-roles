class ApplicationController < ActionController::Base
  helper_method :current_user, :user_signed_in?

  def current_user
    @current_user ||= current_registration.user
  end

  def user_signed_in?
    @user_signed_in ||= registration_signed_in?
  end
end
