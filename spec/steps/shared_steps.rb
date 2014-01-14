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

