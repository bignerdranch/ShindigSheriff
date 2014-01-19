Feature: Finance Approver

Scenario: Accessing Dashboard
  Given I am a logged in finance approver
  Then I should see "Income Awaiting Verification"

Scenario: Accepting Income
  Given I am a logged in finance approver
    And there is an income pending approval
  When I click "Accept"
  The Income should be "Accpted"

Scenario: Rejecting Income
  Given I am a logged in finance approver
    And there is an income pending approval
  When I click "Reject"
  The Income should be "Rejected"