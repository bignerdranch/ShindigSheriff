class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]


  def index
    @user_organizations = current_user.organizations
  end

  def show
    @organization = Organization.find(params[:id])
    @finance_approver = @organization.finance_approver
    session[:organization_id] = params[:id]
  end

  def new
    @organization = Organization.new
  end

  def edit
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      current_user.organizations << @organization
      flash[:notice] = "#{@organization.name.titleize} has successfully been added to user #{current_user.email}!"
      redirect_to dashboard_path(@user)
    else
      flash[:notice] = "Error(s) while creating organization:
      #{@organization.errors.full_messages.to_sentence}"
      redirect_to new_user_organization_path(current_user)
    end
  end

  def update
    if @organization.update(organization_params)
      flash[:notice] = "#{@organization.name.titleize} has successfully been updated!"
      redirect_to user_organizations_path(current_user)
    else
      flash[:notice] = "Error(s) while editing organization:
      #{@organization.errors.full_messages.to_sentence}"
      redirect_to edit_organization_path(@organization)
    end
  end

  def destroy
    if @organization.destroy
      flash[:notice] =  "expense #{@organization.name} has been deleted"
      redirect_to dashboard_path
    else
      flash[:notice] =  "Error(s) while destroying organization: #{@organization.name}"
      redirect_to organization_path(@organization)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:name, :website)
    end
end

