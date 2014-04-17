step "I am at the events show page" do
  visit "/events/#{@event.id}"
end

step "I am at the log expenses page" do
  visit "/transactions/log_expenses/new?event=#{@event.id}"
end
