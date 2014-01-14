Feature: Adding a new organization

Scenario: Succesfully creating a new organization
    Given I am a logged in user
      And I am at the new organizations page
    When I complete the form with the following:
      
      | ID                        | Input                     |
      | organization_name         | Cylon Meetup              |
      | organization_website      | cylons.notaruse.com       |     

      And I click "Create Organization"
    Then I should see "Cylon Meetup"
