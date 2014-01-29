step "I have an pending Income of :amount" do |amount|
  @event.incomes.create(estimated_amount: amount, category_details: "test", 
                                                                status: nil)
end

step "I have a verified Income of :amount" do |amount|
  @event.incomes.create(estimated_amount: amount, category_details: "test", 
                                                                status: true)
end

