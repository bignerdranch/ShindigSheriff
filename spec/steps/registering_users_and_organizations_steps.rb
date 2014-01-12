step "I am a non-registered user" do
  #visit users/signout
end

step "I complete the form with the following:" do |table|
  visit root_path
  table.hashes.each do |table|
    #unless (table["ID"] == nil || table["Input"] == nil)
    fill_in table["ID"], :with => table["Input"]
  end
end

step "I click :button_msg" do |button_msg|
  click_button button_msg
end

step "I should see :text" do |text|
  expect(page).to have_content text
end