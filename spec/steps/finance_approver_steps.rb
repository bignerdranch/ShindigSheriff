# Assigning a Finance Approver
step "I am at the Select A Finance Approver page" do 
  fa_user = User.create(first_name: "finance", 
                        last_name: "approver", 
                        email: "fa@org.com", 
                        password: "password")
  @fa = FinanceApproverRole.create(user: fa_user)

  organization = Organization.create(name: "cats anon", website: "www.catwhoareyou?.com")

  visit "/organizations/#{organization.id}"
  click_link_or_button "Add Finance Approver"
end

step "I select an finance approver" do
  page.select "Finance Approver : fa@org.com", :from => "organization_finance_approver"
  click_link_or_button "Add Finance Approver"
end

step "I do not select a finance approve" do 
  click_link_or_button "Add Finance Approver"
end


# Dashboard features - accepting and rejecting incomes
step "I am a logged in finance approver" do 
  @user = FactoryGirl.create(:user, :as_finance_approver)
  send "sign in"
end

step "there is an income pending approval" do 
end
