step "I am at the homepage" do
  visit '/'
end

step "I complete the form with the following:" do |table|
  table.hashes.each do |table|
    fill_in table["ID"], :with => table["Input"]
  end
end

step "I click :text" do |text|
  click_link_or_button text
end

step "the user:" do |table|
  user_info = {}
  table.hashes.each { |t| user_info[t["ID"]] = t["Input"] }
  @user = User.create!(user_info)
end

step "a user with an event" do
  @user = FactoryGirl.create(:user)
  organization = FactoryGirl.create(:organization)
  @event = FactoryGirl.create(:event)
  @event.save!

  organization.events << @event
  @user.organizations << organization
end

step "I am a new user" do
  @user = FactoryGirl.create(:user)
end

step "sign in" do 
  visit '/'
  fill_in "signin-email", :with => @user.email
  fill_in "signin-password", :with => @user.password
  click_button "Sign In"
end

step "I am a logged in user" do 
  send "I am a new user"
  send "sign in"
end

step "I should see :text" do |text|
  expect(page).to have_content text
end


