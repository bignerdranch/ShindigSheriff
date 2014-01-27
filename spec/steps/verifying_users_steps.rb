step "I am an unverified user registered through email" do 
  @user = FactoryGirl.build(:user, :not_verified)
  send "assign finance approver role"
end

step "my temporary password matches" do
  fill_in "user_password", with: "password123"
  fill_in "user_new_password", with: "animals456"
end

step "my temporary password does not match" do 
  fill_in "user_password", with: "123"
  fill_in "user_new_password", with: "animals456"
end

step "I do not complete the form" do 
end

