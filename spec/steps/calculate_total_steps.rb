step "I have an pending Income of :amount" do |amount|
  category = Category.where(FactoryGirl.attributes_for(:category)).first_or_create!
  @event.incomes.create(estimated_amount: amount,
                          category_details: "test", category: category)
end

step "I have a verified Income of :amount" do |amount|
  category = Category.where(FactoryGirl.attributes_for(:category)).first_or_create!
  @event.incomes.create(estimated_amount: amount, status: true, 
                          category_details: "test", category: category)
end

step "I have an pending Expense of :amount" do |amount|
  @event.expenses.create(estimated_amount: amount, category_details: "test", 
                                                                status: nil)
end

step "I have a verified Expense of :amount" do |amount|
  @event.expenses.create(estimated_amount: amount, category_details: "test", 
                                                                status: true)
end
