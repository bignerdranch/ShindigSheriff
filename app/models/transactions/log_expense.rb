require 'active_model'

module Transactions
  class LogExpense
    include ActiveModel::Model

    def initialize(params)
      @event_id = params.fetch(:event_id)
    end

    def event
      @event ||= Event.find(@event_id)
    end
  end
end
