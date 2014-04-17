step "I am at the log expenses page" do
  visit "/transactions/log_expenses/new?event_id=#{@event.id}"
end
