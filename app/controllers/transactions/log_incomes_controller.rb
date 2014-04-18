module Transactions
  class LogIncomesController < ApplicationController

    def new
      @log_income = LogIncome.new(params)
    end
  end
end
