# Assigning a Finance Approver
step "I am at the Select A Finance Approver page" do 
  @fa = FactoryGirl.build(:user)
  role = FactoryGirl.create(:role, :as_finance_approver)
  @fa.roles << role 
  @fa.save!

  organization = Organization.create(name: "cats anon", website: "www.catwhoareyou?.com")

  visit "/organizations/#{organization.id}"
  click_link_or_button "Add Finance Approver"
end

step "I am assigned to an organization" do 
  organization = FactoryGirl.create(:organization, finance_approver_id: @user.id, user_id: '999')
  @user.organizations << organization
end

step "I select an finance approver" do
  page.select "#{@fa.info}", :from => "finance_approver_id"
  click_link_or_button "Add Finance Approver"
end

step "I do not select a finance approver" do 
  click_link_or_button "Add Finance Approver"
end


# Dashboard features - accepting and rejecting incomes
step "I am a logged in finance approver" do 
  @user = FactoryGirl.build(:user)
  @user.roles << Role.find_or_create_by(name: "finance approver")
  @user.save!
  send "I sign in"
end

step "there is an income pending approval" do 
  organization = FactoryGirl.create(:organization, finance_approver_id: @user.id, user_id: '1')
  event = FactoryGirl.create(:event)
  event.organizations << organization
  income = FactoryGirl.create(:income, event_id: event.id)
end

step "there is an expense pending approval" do 
  organization = FactoryGirl.create(:organization, finance_approver_id: @user.id, user_id: '1')
  event = FactoryGirl.create(:event)
  event.organizations << organization
  expense = FactoryGirl.create(:expense, event_id: event.id)
end


