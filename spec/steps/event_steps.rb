step "I am at the organization new event page" do
  visit "/organizations/#{@organization.id}/events/new"
end

step "I complete the new event form" do
  fill_in "event_name", :with => "pool party"
  fill_in "event_date", :with => "Jan 20, 2020"
  fill_in "event_time", :with => "1020AM"
  fill_in 'event_location', :with => 'pool'
  fill_in 'event_purpose', :with => 'swimming'
end

