class EmailRegistrationController < ApplicationController
  def new
    @user = User.new
    @roles = Role.all
  end

  def create
  end
end