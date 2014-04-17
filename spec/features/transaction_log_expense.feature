Feature: Transaction Log Expenses

 Scenario: Succesfully creating a new expense
    Given I am a logged in user with an event
      And I am at the log expenses page
    When I complete the form with the following:

      | ID                         | Input                     |
      | expense_estimated_amount   | 10.00                     |
      | expense_category_details   | meeting setup             |

      And I click "Add Expense"
    Then I should see "$10.00"

  Scenario: Incomplete form
    Given I am a logged in user with an event
      And I am at the log expenses page
    When I complete the form with the following:

      | ID                         | Input                     |
      | expense_estimated_amount   | 10.00                     |

      And I click "Add Expense"
    Then I should see "Category details can't be blank"

 Scenario: Succesfully creating a new expense
    Given I am a logged in user with an event
      And I am at the events show page
    When I click 'Add expense'
    Then I am at the log expenses page
