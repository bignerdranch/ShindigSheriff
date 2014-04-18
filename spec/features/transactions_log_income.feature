Feature: Adding a new income

  Scenario: Navigating to the form
    Given I am a logged in user with an event
      And I am at the event page
    When I click 'Add Income'
    Then I should see 'Add an income'
