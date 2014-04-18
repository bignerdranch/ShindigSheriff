step "I should see :text the event name" do |text|
  text_string = "#{text} #{@event.name}"
  expect(page).to have_content text_string
end
