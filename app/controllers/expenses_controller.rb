class ExpensesController < ApplicationController
  include StatusHelper
  before_action :set_expense

  def destroy
    event = @expense.event
    authorize @expense
    @expense.destroy
    flash[:notice] =  "expense #{@expense.category_details} for $#{@expense.estimated_amount} has been deleted"
    redirect_to sekret_event_path(event)
  end

  def verify
    authorize @expense
    @expense.update_attribute(:status, true)
    flash[:notice] =  "expense has been verified"
    redirect_to dashboard_path(@user)
  end

  def reject
    authorize @expense
    @expense.update_attribute(:status, false)
    flash[:notice] =  "expense has been rejected"
    redirect_to dashboard_path(@user)
  end
  
  private
  
  def set_expense
        @expense = Expense.find(params[:id])
  end
end
