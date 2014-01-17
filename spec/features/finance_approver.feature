Feature: Assigning a Finance Approver

Scenario: Succesfully assigning a finance approver to an organization
    Given the non-finance user:

      | ID                   | Input                       |
      | first_name           | Boomer                      |
      | last_name            | Valerii                     |
      | email                | eight@cylons.com            |
      | phone_number         | 555-555-5555                |
      | password             | password                    | 

    When I am a logged in user
      And I am at an organizations show page
      And I click link "Add Finance Approver"
    When I select the non-finance user
      And I click "Add Finance Approver"
    Then I should see "Finance Approver: Boomer Valerii eight@cylons.com"