class ExpensesController < ApplicationController
  include StatusHelper

  def new
    @event = Event.find(params[:event_id])
    @expense = @event.expenses.new
    authorize @expense
  end

  def destroy
    @expense = Expense.find(params[:id])
    event = @expense.event
    authorize @expense
    @expense.destroy
    flash[:notice] =  "expense #{@expense.category_details} for $#{@expense.estimated_amount} has been deleted"
    redirect_to sekret_event_path(event)
  end

  def show
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

  def create
    @event = Event.find(params[:event_id])
    @expense = @event.expenses.new(expense_params)
    authorize @expense

    if @expense.save
      flash[:notice] = "#{@expense.estimated_amount} has successfully been added to organization #{@event.name}!"
      redirect_to sekret_event_path(@event)
    else
      flash[:notice] = "Error(s) while creating expense:
      #{@expense.errors.full_messages.to_sentence}"
      redirect_to new_event_expense_path(@event)
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:estimated_amount, :actual_amount,
                                   :date_received, :category_details, :status, :event_id)
  end

end

