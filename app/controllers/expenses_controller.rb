class ExpensesController < ApplicationController
  include StatusHelper

  def new
    @event = Event.find(params[:event_id])
    @expense = @event.expenses.new
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.delete
    redirect_to dashboard_path(@user)
    flash[:notice] =  "expense #{@expense.category_details} for $#{@expense.estimated_amount} has been deleted"
  end

  def show
  end

  def verify
      @expense = Expense.find(params[:id])

      @expense.update_attribute(:status, true)
      redirect_to dashboard_path(@user)
      flash[:notice] =  "expense has been verified"
  end

   def reject
      @expense = Expense.find(params[:id])
      @expense.update_attribute(:status, false)
      redirect_to dashboard_path(@user)
      flash[:notice] =  "expense has been rejected"
  end

  def create
    @event = Event.find(params[:event_id])
    @expense = Expense.new(expense_params)
    
    if @expense.valid? 
      @event.expenses.build(expense_params).save!
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

