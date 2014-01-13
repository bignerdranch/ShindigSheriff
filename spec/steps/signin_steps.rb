step "I am the current user" do |table|
  user_info = {}
  table.hashes.each do |user|
    user_info[user["ID"]] = user["Input"]
  end
  @user = User.create(user_info)
end

step "I am at the homepage" do
  visit root_path
end

step "I see a welcome message" do
  expect(page).to have_content "Welcome"
end