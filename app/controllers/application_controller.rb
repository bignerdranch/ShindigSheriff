class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  def after_sign_in_path_for(resource)
    if user_signed_in?
      user_path(resource)
    else
      new_user_path
    end
  end

end