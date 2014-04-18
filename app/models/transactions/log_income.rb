require 'active_model'

module Transactions
  class LogIncome
    include ActiveModel::Model

    attr_reader :category_details, :category_id, :estimated_amount, :event_id, :estimated_amount

    def initialize(attributes)
      @event_id = attributes.fetch(:event_id)
    end

    def event_name
      event.name
    end

    private

    def event
      @event ||= Event.find(event_id)
    end
  end
end
