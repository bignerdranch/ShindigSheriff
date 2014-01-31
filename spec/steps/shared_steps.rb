step "I am at the homepage" do
  send "load roles"
  visit '/'
end

step "I am at the event page" do 
  visit "/events/#{@event.id}"
end

step "I complete the form with the following:" do |table|
  table.hashes.each do |table|
    fill_in table["ID"], :with => table["Input"]
  end
end

step "I click :text" do |text|
  click_link_or_button text
end

step "the organizer user:" do |table|
  user_info = {}
  table.hashes.each { |t| user_info[t["ID"]] = t["Input"] }
  @user = User.new(user_info)
  send "assign organizer role"
end

step "a user with an event" do
  @user = FactoryGirl.build(:user)
  send "assign organizer role"
  
  organization = FactoryGirl.create(:organization)
  @event = FactoryGirl.create(:event)
  @event.save!

  organization.events << @event
  @user.organizations << organization

  @category = Category.where(FactoryGirl.attributes_for(:category)).first_or_create!
end

step "a user with an expense" do
  send "a user with an event"
  @expense = FactoryGirl.create(:expense)
  @expense.save!
  @event.expenses << @expense
end

step "a user with an income" do
  send "a user with an event"
  @income = FactoryGirl.create(:income, category: @category)
  @income.save!
  @event.incomes << @income
end

step "I am a logged in user with an event" do
  send "a user with an event"
  send "I sign in"
end

step "I am a new user" do
  @user = FactoryGirl.build(:user)
  send "assign organizer role"

  @organization = FactoryGirl.create(:organization)
  @organization.save!

  @event = FactoryGirl.create(:event)
  @event.save!

  @organization.events << @event
  @user.organizations << @organization
end

step "I sign in" do 
  visit '/'
  fill_in "signin-email", :with => @user.email
  fill_in "signin-password", :with => @user.password
  click_button "Sign In"
end

step "I am a logged in user" do 
  send "I am a new user"
  send "I sign in"
end

step "I should see :text" do |text|
  expect(page).to have_content text
end

step "load roles" do
  Role.where(FactoryGirl.attributes_for(:role)).first_or_create!
  Role.where(FactoryGirl.attributes_for(:role, :as_finance_approver )).first_or_create!
end

step "assign organizer role" do
  @user.roles << Role.find_or_create_by(name: "organizer")
  @user.save!
end

step "assign finance approver role" do
  @user.roles << Role.find_or_create_by(name: "finance approver")
  @user.save!
end

