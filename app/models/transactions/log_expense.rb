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

    def success?
      create_expense.valid?
    end

    private

    def event
      @event ||= Event.find(@event_id)
    end

    def create_expense
      Expense.create(expense_params)
    end

    def expense_params
      @expense_attributes.permit(:category_details, :estimated_amount, :event_id)
    end
  end
end
