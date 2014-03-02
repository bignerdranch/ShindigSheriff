step "I am at the log expenses page" do
  visit "/transactions/log_expenses/new?event=#{@event.id}"
end
