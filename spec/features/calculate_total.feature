Feature: Calculate Total

  Scenario: Displaying Estimated Incomes
    Given I am a logged in user with an event
      And I have an pending Income of "10.00"
      And I have a verified Income of "20.00"
    When I am at the event page
    Then I should see "Total Estimated Income = $30.00"

  Scenario: Displaying Actual Incomes
    Given I am a logged in user with an event
      And I have an pending Income of "10.00"
      And I have a verified Income of "20.00"
      And I have a verified Income of "30.00"
    When I am at the event page
    Then I should see "Total Actual Income = $50.00"

  Scenario: Displaying Estimated Expenses
    Given I am a logged in user with an event
      And I have an pending Expense of "40.00"
      And I have a verified Expense of "20.00"
    When I am at the event page
    Then I should see "Total Estimated Expense = $60.00"

  Scenario: Displaying Actual Expenses
    Given I am a logged in user with an event
      And I have an pending Expense of "50.00"
      And I have a verified Expense of "50.00"
      And I have a verified Expense of "50.00"
    When I am at the event page
    Then I should see "Total Actual Expense = $100.00"

