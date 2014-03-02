Feature: Expenses

  Scenario: Succesfully deleting an existing expense
    Given I am a logged in user with an expense
      And I am at the event page
    When I click "Delete"
    Then I should see "has been deleted"
