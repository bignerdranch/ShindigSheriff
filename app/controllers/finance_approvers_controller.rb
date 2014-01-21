class FinanceApproversController < ApplicationController
  def index
    @organization = Organization.find(session[:organization_id])
    @finance_approvers = FinanceApproverRole.users
  end 

  def update
    user = User.find_by_id(params["finance_approver"]["user_id"])
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
      redirect_to finance_approvers_path
    end
  end
end