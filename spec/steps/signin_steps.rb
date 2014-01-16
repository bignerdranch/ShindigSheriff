step "I am at the homepage" do
  visit root_path
end

step "I see a welcome message" do
  expect(page).to have_content "Logged in as #{@user.email}"
end


step "I am a new user" do
  @user = FactoryGirl.create(:user)
end