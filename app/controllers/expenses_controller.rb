class ExpensesController < ApplicationController
  include StatusHelper

  def destroy
    @expense = Expense.find(params[:id])
    event = @expense.event
    authorize @expense
    @expense.destroy
    flash[:notice] =  "expense #{@expense.category_details} for $#{@expense.estimated_amount} has been deleted"
    redirect_to sekret_event_path(event)
  end

  def verify
    @expense = Expense.find(params[:id])
    authorize @expense
    @expense.update_attribute(:status, true)
    flash[:notice] =  "expense has been verified"
    redirect_to dashboard_path(@user)
  end

  def reject
    @expense = Expense.find(params[:id])
    authorize @expense
    @expense.update_attribute(:status, false)
    flash[:notice] =  "expense has been rejected"
    redirect_to dashboard_path(@user)
  end
end
