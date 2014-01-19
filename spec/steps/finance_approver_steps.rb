step "I am a logged in finance approver" do 
  @user = FactoryGirl.create(:user, :as_finance_approver)
  send "sign in"
end