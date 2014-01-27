Feature: Adding a new event

  Scenario: Succesfully creating a new event
    Given I am a logged in user
      And I am at the organization new event page
    When I complete the new event form

      And I click "Create Event"
    Then I should see "Pool Party"

  Scenario: Incomplete form
    Given I am a logged in user
      And I am at the organization new event page
    When I complete the form with the following:

      | ID                        | Input                    |
      | event_name                | Pool Party               |

      And I click "Create Event"
    Then I should see "Date can't be blank"