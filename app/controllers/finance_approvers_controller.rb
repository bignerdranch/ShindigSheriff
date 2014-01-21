class FinanceApproversController < ApplicationController

  def new
    @organization = Organization.find(params[:organization_id])
    @finance_approvers = FinanceApprover.all
  end

  def create
    if @finance_approver.save
      flash[:notice] = "#{@finance_approver.user.first_name.capitalize!} is a Finance Approver!"
      redirect_to user_organization_path(current_user, @organization)
    else
      flash[:notice] = "Error(s) while creating income:
      #{@finance_approver.errors.full_messages.to_sentence}"
      redirect_to new_organization_finance_approver_path(@organization)
    end
  end

  def financeapprover
  end

  private

  def finance_approver_params
    params.require(:finance_approver).permit(:user_id)
  end
end

