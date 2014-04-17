Feature: Transaction Log Expenses

 Scenario: Succesfully creating a new expense
    Given I am a logged in user with an event
      And I am at the log expenses page
    When I complete the form with the following:

      | ID                                          | Input          |
      | transactions_log_expense_estimated_amount   | 10.00          |
      | transactions_log_expense_category_details   | meeting setup  |

      And I click "Add Expense"
    Then I should see "$10.00"

  Scenario: Incomplete form
    Given I am a logged in user with an event
      And I am at the log expenses page
    When I complete the form with the following:

      | ID                                          | Input  |
      | transactions_log_expense_estimated_amount   | 10.00  |

      And I click "Add Expense"
    Then I should see "Error(s) while creating expense"
