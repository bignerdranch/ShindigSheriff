step "I am a logged in finance approver" do 
  @user = FactoryGirl.create(:user, :as_finance_approver)
  send "sign in"
end

step "I am at the Select A Finance Approver page" do 
  fa_user = User.create(first_name: "finance", 
                        last_name: "approver", 
                        email: "fa@org.com", 
                        password: "password")
  @fa = FinanceApprover.create(user: fa_user)

  organization = Organization.create(name: "cats anon", website: "www.catwhoareyou?.com")

  visit "/organizations/#{organization.id}"
  click_link_or_button "Add Finance Approver"
end

step "I add an finance approver" do
  page.select "Finance Approver : fa@org.com", :from => "finance_approver_user_id"
  click_link_or_button "Add Finance Approver"
end

step "I should see the finance approver on the organization dashboard" do 
  expect(page).to have_content "Finance Approver: Finance Approver fa@org.com"
end