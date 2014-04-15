class FinanceApproversController < ApplicationController
  def new
    @finance_approvers = Role.finance_approver
  end

  def create
    user = User.find_by_id(params["finance_approver"]["id"])
    @organization = Organization.find(session[:organization_id])

    if user
      @organization.update_attributes(finance_approver: user)
      session[:organization_id].clear
      flash[:notice] =
      "#{@organization.finance_approver.first_name.capitalize}
                                              is a Finance Approver!"
      redirect_to organization_path(@organization)
    else
      flash[:notice] = "Error(s) while selecting Finance Approver: Please select a user"
      redirect_to new_finance_approver_path
    end
  end

  def show
  end
end
