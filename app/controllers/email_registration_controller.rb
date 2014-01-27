class EmailRegistrationController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    @user.role = params[:user][:role]
    organization = Organization.find(session[:organization_id])
    @user.organizations << organization
    @user.password = Devise.friendly_token.first(8)

    if @user.save
      UserMailer.registration_email({user: @user, 
                                    organization_name: organization.name, 
                                    organizer_name: current_user.display_name}).deliver
      flash[:notice] = "#{@user.email} has been sent an email verification!"
      redirect_to dashboard_path(current_user)
    else
      flash[:notice] = "#{@user.errors.full_messages.to_sentence}"
      redirect_to new_finance_approver_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :role)
  end
end

