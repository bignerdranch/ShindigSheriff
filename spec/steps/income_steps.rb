step "I am a logged in user with an event" do
  user = FactoryGirl.create(:user)
  organization = FactoryGirl.create(:organization)
  @event = FactoryGirl.create(:event)

  organization.events << @event
  user.organizations << organization

  visit '/'
  fill_in "signin-email", :with => user.email
  fill_in "signin-password", :with => user.password
  click_button "Sign In"
end

step "I am at the event new income page" do
  visit "/events/#{@event.id}/incomes/new"
end

