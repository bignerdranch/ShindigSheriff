require 'active_model'

module Transactions
  class LogExpense
    include ActiveModel::Model

    attr_reader :event

    def initialize(event)
      @event = event
    end
  end
end
