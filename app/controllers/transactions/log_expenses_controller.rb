module Transactions
  class LogExpensesController < ApplicationController

    def new
      @log_expense = LogExpense.new(params)
    end

    def create
    end

  end
end
