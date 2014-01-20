class IncomesController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @incomes = @event.incomes
    @organization = @event.organizations.first
  end

  def new
    @event = Event.find(params[:event_id])
    @income = @event.incomes.new
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
                                   :date_received, :category_details, :event_id)
  end

end

