require 'active_model'

module Transactions
  class LogIncome < ActiveRecord::Base
    include ActiveModel::Model

    attr_reader :event_id

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
