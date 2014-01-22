class UsersController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:new, :create]
  include UsersHelper

  def show
    if current_user.has_role?("finance approver")
      render "finance_show"
    elsif current_user.has_role?("organizer")
      @user = current_user
    else
      flash[:errors] = "Error(s) while creating user role"
    end
  end

  def new
    @user = User.new
    @roles = Role.all
  end

  def create
    @organization = Organization.new(params[:user].delete(:organization))
    @user = User.new(user_params)

    if @user.save && @organization.save
      @user.organizations << @organization
      sign_in @user
      flash[:notice] = "#{@user.first_name.upcase} has successfully been created!"
      redirect_to dashboard_path(@user)
    else
      flash[:errors] = "Error(s) while creating user/organization 
          #{@user.errors.full_messages.to_sentence} 
          #{@organization.errors.full_messages.to_sentence}"
      redirect_to sign_in_path
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :phone_number, :organization, :event)
    end
end

