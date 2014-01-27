step "I see a welcome message" do
  expect(page).to have_content "Logged in as #{@user.email}"
end

step "I am the user:" do |table|
  user_info = {}
  table.hashes.each do |user|
    user_info[user["ID"]] = user["Input"]
  end
  @user = User.new(user_info)
  @user.verify
  send "assign organizer role"
end

step "I am an unverified user" do
  @user = FactoryGirl.build(:user, :not_verified)
  @user.roles << Role.find_or_create_by(name: "finance approver")
  @user.save!
end
