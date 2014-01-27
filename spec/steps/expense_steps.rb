step "I am at the event new expense page" do
  visit "/events/#{@event.id}/expenses/new"
end

step "I am a logged in user with an expense" do
  send "a user with an expense"
  send "I sign in"
end

