step "I am at the homepage" do
  visit root_path
end

step "I complete the form with the following:" do |table|
  table.hashes.each do |table|
    fill_in table["ID"], :with => table["Input"]
  end
end

step "I click :button_msg" do |button_msg|
  click_button button_msg
end

step "I am a new user" do
  @user = FactoryGirl.create(:user)
end

step "I am a logged in user" do 
  send "I am a new user"

  visit '/'
  fill_in "signin-email", :with => @user.email
  fill_in "signin-password", :with => @user.password
  click_button "Sign In"
end

step "I should see :text" do |text|
  expect(page).to have_content text
end



