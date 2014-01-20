class FinanceApproversController < ApplicationController

  def new
    @finance_approver = FinanceApprover.new
    @organization = Organization.find(params[:organization_id])
    @users = FinanceApprover.fa_users
  end

  def create
    @organization = Organization.find(params[:organization_id])
    @finance_approver = FinanceApprover.new(finance_approver_params)
    @finance_approver.organization = @organization

    if @finance_approver.save
      flash[:notice] = "#{@finance_approver.user.first_name.capitalize!} is a Finance Approver!"
      redirect_to user_organization_path(current_user, @organization)
    else
      flash[:notice] = "Error(s) while creating income:
      #{@finance_approver.errors.full_messages.to_sentence}"
      redirect_to new_organization_finance_approver_path(@organization)
    end
  end

  private

  def finance_approver_params
    params.require(:finance_approver).permit(:user_id, :organization_id)
  end
end

