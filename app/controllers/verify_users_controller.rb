class VerifyUsersController < ApplicationController

  def new
  end
  
  def create
    if current_user.valid_password?(params[:user][:password])
      current_user.update_attributes(password: params[:user][:new_password])
      
      if current_user.save!
        current_user.verify
        flash[:notice] = "password has successfully been updated!"
        redirect_to dashboard_path(current_user)
      else
        flash[:notice] = "#{current_user.errors.full_messages.to_sentence}"
        redirect_to new_verify_user_path
      end

    else
      flash[:notice] = "There was a problem changing your temporary password, please try again."
      redirect_to new_verify_user_path
    end
  end
end