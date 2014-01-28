class IncomesController < ApplicationController
  include StatusHelper

  def new
    @event = Event.find(params[:event_id])
    @income = @event.incomes.new
  end

  def destroy
    @income = Income.find(params[:id])
    @income.delete
    redirect_to params[:return_to] || dashboard_path(@user)
    flash[:notice] =  "Income #{@income.category_details} for $#{@income.estimated_amount} has been deleted"
  end

  def show
  end

  def verify
      @income = Income.find(params[:id])

      @income.update_attribute(:status, true)
      redirect_to dashboard_path(@user)
      flash[:notice] =  "Income has been verified"
  end

   def reject
      @income = Income.find(params[:id])
      @income.update_attribute(:status, false)
      redirect_to dashboard_path(@user)
      flash[:notice] =  "Income has been rejected"
  end

  def create
    @event = Event.find(params[:event_id])
    @income = Income.new(income_params)
    
    if @income.valid? 
      @event.incomes.build(income_params).save!
      flash[:notice] = "#{@income.estimated_amount} has successfully been added to organization #{@event.name}!"
      redirect_to sekret_event_path(@event)
    else
      flash[:notice] = "Error(s) while creating income:
      #{@income.errors.full_messages.to_sentence}"
      redirect_to new_event_income_path(@event)
    end
  end

  private

  def income_params
    params.require(:income).permit(:estimated_amount, :actual_amount, 
                                   :date_received, :category_details, :status, :event_id)
  end

end

