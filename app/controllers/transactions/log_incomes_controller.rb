module Transactions
  class LogIncomesController < ApplicationController

    def new
      @log_income = LogIncome.new(params)
      @categories = Category.all
    end
  end
end
