Feature: Calculate Total

  Scenario: Adding Estimated Incomes
    Given I am a logged in user with an event
      And I have an pending Income of "10.00"
      And I have a verified Income of "20.00"
    When I am at the event page
    Then I should see "Total Estimated Income = $30.00" 

