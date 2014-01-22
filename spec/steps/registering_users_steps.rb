step "I select the role :role" do |role|
  page.select role, :from => "user_id"
end

step "I do not select a role" do 
end