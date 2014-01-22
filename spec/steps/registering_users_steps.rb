step "I select the role :role" do |role|
  page.select role, :from => "user_role_id"
end

step "I do not select a role" do 
end

step "organizations count should not change when I click Create Account" do
  expect{ click_button "Create Account" }.not_to change(Organization, :count)
end 

