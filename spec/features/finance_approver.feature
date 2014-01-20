Feature: Finance Approver

Scenario: Assigned to an organization
  Given I am a logged in user
    And I am at the Select A Finance Approver page
  When I select an finance approver
  Then I should see "is a Finance Approver!"

Scenario: Unsuccesfully assigned to an organization
  Given I am a logged in user
    And I am at the Select A Finance Approver page
  When I do not select a finance approve
  Then I should see "Error(s)"


Scenario: Accessing Dashboard
  Given I am a logged in finance approver
  Then I should see "Income Awaiting Verification"

Scenario: Pending income
  Given there is an income pending approval
    And I am a logged in finance approver
  Then I should see "Pending"

Scenario: Rejecting Income
  Given there is an income pending approval
    And I am a logged in finance approver
  When I click "Verify"
  Then I should see "Verified"