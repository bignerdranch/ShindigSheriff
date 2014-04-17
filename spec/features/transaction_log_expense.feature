Feature: Transaction Log Expenses

 Scenario: Succesfully creating a new expense
    Given I am a logged in user with an event
      And I am at the events show page
    When I click 'Add expense'
    Then I am at the log expenses page
