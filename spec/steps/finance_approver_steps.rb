# Assigning a Finance Approver
step "I am at the Select A Finance Approver page" do 
  @fa = FactoryGirl.create(:user)
  role = FactoryGirl.create(:role, :as_finance_approver)
  @fa.roles << role 

  organization = Organization.create(name: "cats anon", website: "www.catwhoareyou?.com")

  visit "/organizations/#{organization.id}"
  click_link_or_button "Add Finance Approver"
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
  @user = FactoryGirl.create(:user)
  role = FactoryGirl.create(:role, :as_finance_approver)
  @user.roles << role 
  send "sign in"
end

step "there is an income pending approval" do 
end
