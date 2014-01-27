Feature: Expenses

 Scenario: Succesfully creating a new expense
    Given I am a logged in user with an event
      And I am at the event new expense page
    When I complete the form with the following:

      | ID                         | Input                     |
      | expense_estimated_amount   | 10.00                     |
      | expense_category_details   | meeting setup             |   

      And I click "Add Expense"
    Then I should see "$10.00"

  Scenario: Incomplete form
    Given I am a logged in user with an event
      And I am at the event new expense page
    When I complete the form with the following:

      | ID                         | Input                     |
      | expense_estimated_amount   | 10.00                     |

      And I click "Add Expense"
    Then I should see "Category details can't be blank"

  Scenario: Succesfully deleting an existing expense
    Given I am a logged in user with an expense
      And I am at the event page
    When I click "Delete"
    Then I should see "has been deleted"

