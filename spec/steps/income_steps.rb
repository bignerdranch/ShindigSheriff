step "I am a logged in user with an event" do
  send "a user with an event"
  send "I sign in"
end

step "I am at the event new income page" do
  visit "/events/#{@event.id}/incomes/new"
end

step "I am a logged in user with an income" do
  send "a user with an income"
  send "I sign in"
end


