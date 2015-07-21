class IncomesController < ApplicationController
  include StatusHelper, CalculateTotalHelper
before_action :set_income, only:[:destroy,:verify,:reject]

def new
    @categories = Category.all
    @income = event.incomes.new
    authorize @income
  end

  def destroy
    authorize @income
    @income.destroy
    flash[:notice] =  "Income #{@income.category_details} for $#{@income.estimated_amount} has been deleted"
    redirect_to params[:return_to] || dashboard_path(@user)
  end

  def show
  end

  def verify
    authorize @income
    @income.update_attribute(:status, true)
    flash[:notice] =  "Income has been verified"
    redirect_to dashboard_path(@user)
  end

   def reject
    authorize @income
    @income.update_attribute(:status, false)
    flash[:notice] =  "Income has been rejected"
    redirect_to dashboard_path(@user)
  end

   def create
    @income = event.incomes.build(income_params)
    authorize @income

    if @income.save
      flash[:notice] = "#{@income.estimated_amount} has successfully been added to organization #{event.name}!"
      redirect_to sekret_event_path(event)
    else
      flash[:notice] = "Error(s) while creating income: #{@income.errors.full_messages.to_sentence}"
      redirect_to new_event_income_path(event)
    end
  end

  private
  
  def set_income
      @income = Income.find(params[:id])
  end

  def income_params
    params.require(:income).permit(:estimated_amount, :actual_amount,
                                   :date_received, :category_details,
                                   :status, :event_id, :category_id)
  end

  def event
    @hello ||= Event.find(params[:event_id])
  end
  helper_method(:event)

end

