Feature: Assigning a Finance Approver

Scenario: Succesfully assigning a finance approver to an organization
    Given I am a logged in user
      And I am at an organizations show page
    When I click link "Add Finance Approver"
    Then I should see "Select user as Finance Approver"