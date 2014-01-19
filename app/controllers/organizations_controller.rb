class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  # GET /organizations
  # GET /organizations.json
  def index
    @user_organizations = current_user.organizations
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    @organization = Organization.find(params[:id])
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      current_user.organizations << @organization
      flash[:notice] = "#{@organization.name.titleize} has successfully been added to user #{current_user.email}!"
      redirect_to user_organizations_path(current_user)
    else
      flash[:notice] = "Error(s) while creating organization:
      #{@organization.errors.full_messages.to_sentence}"
      redirect_to new_user_organization_path(current_user)
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    if @organization.update(organization_params)
      flash[:notice] = "#{@organization.name.titleize} has successfully been updated!"
      redirect_to user_organizations_path(current_user)
    else
      flash[:notice] = "Error(s) while editing organization:
      #{@organization.errors.full_messages.to_sentence}"
      redirect_to edit_user_organization_path(current_user)
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json    
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url }
      format.json { head :no_content }
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

