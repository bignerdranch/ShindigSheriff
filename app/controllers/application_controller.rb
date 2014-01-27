class ApplicationController < ActionController::Base
  include Pundit
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

