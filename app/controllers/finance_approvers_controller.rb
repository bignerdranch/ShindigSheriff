class FinanceApproversController < ApplicationController

  def new
    @finance_approver = FinanceApprover.new
  end
end