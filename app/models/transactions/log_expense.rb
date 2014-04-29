require 'active_model'

module Transactions
  class LogExpense
    include ActiveModel::Model

    attr_reader :category_details, :estimated_amount, :event_id

    def initialize(params)
      @event_id = params.fetch(:event_id) { params["transactions_log_expense"]["event_id"] }
      @expense_attributes = params["transactions_log_expense"]
    end

    def event_name
      event.name
    end

    def save
      create_expense
    end

    private

    def event
      @event ||= Event.find(event_id)
    end

    def create_expense
      expense.save
    end

    def expense_params
      @expense_attributes.permit(:category_details, :estimated_amount)
    end

    def expense
      event.expenses.new(expense_params)
    end
  end
end
