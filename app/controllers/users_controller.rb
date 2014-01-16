class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_user!, only: [:new, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    if user_signed_in?
      redirect_to user_path(current_user)
    end
    
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @organization = Organization.new(params[:user].delete(:organization))
    @user = User.new(user_params)

    if @user.save && @organization.save
      @user.organizations << @organization
      sign_in @user
      flash[:notice] = "#{@user.first_name.upcase} has successfully been created!"
      redirect_to user_path(@user)
    else
      flash[:errors] = "Error(s) while creating user/organization 
          #{@user.errors.full_messages.to_sentence} 
          #{@organization.errors.full_messages.to_sentence}"
      redirect_to root_path
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :phone_number, :organization)
    end
end

