step "I am at the root path" do 
  visit '/'
end

step "I should see :ShindigSheriff" do |title| 
  expect(page).to have_content title
end