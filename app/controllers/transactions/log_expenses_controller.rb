module Transactions
  class LogExpensesController < ApplicationController
    before_action :set_log

    def new
    end

    def create
      if @log_expense.save
        flash[:notice] = "#{@log_expense.estimated_amount} has successfully been added to organization #{@log_expense.event_name}!"
        redirect_to sekret_event_path(@log_expense.event_id)
      else
        flash[:notice] = "Error(s) while creating expense"
        redirect_to new_transactions_log_expenses_path(event_id: @log_expense.event_id)
      end
    end
    
    private
    
    def set_log_expense
      @log_expense = LogExpense.new(params)
    end
  end
end
