module Transactions
  class LogExpensesController < ApplicationController

    def new
      @log_expense = LogExpense.new(params)
    end

    def create
      @log_expense = LogExpense.new(params)
      if @log_expense.success?
        flash[:notice] = "#{@log_expense.estimated_amount} has successfully been added to organization #{@log_expense.event_name}!"
        redirect_to sekret_event_path(@log_expense.event_id)
      else
        flash[:notice] = "Error(s) while creating expense"
        redirect_to new_transactions_log_expenses_path(event_id: @log_expense.event_id)
      end
    end
  end
end
