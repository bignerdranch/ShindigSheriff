step "the non-finance user:" do |table|
  user_info = {}
  table.hashes.each { |t| user_info[t["ID"]] = t["Input"] }
  @finance_user = User.create!(user_info)
end

step "I am at an organizations show page" do 
  visit "/organizations/#{@organization.id}"
end

step "I select the non-finance user" do
  binding.pry
  page.select("eight@cylons.com", from: "finance_approver_user_id")
end