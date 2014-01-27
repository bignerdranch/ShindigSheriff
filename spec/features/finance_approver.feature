Feature: Finance Approver

Scenario: Finance Approver assigned to an organization
  Given I am a logged in finance approver
    And I am assigned to an organization
    And I am at the homepage
  Then I should see "Organizer"

Scenario: Unsuccesfully assigned to an organization
  Given I am a logged in user
    And I am at the Select A Finance Approver page
  When I do not select a finance approver
  Then I should see "Error(s)"

Scenario: Accessing Dashboard
  Given I am a logged in finance approver
  Then I should see "Income Awaiting Verification"


Scenario: Selecting a Finance Approver for an organization
  Given I am a logged in user
    And I am at the Select A Finance Approver page
  When I select an finance approver
  Then I should see "is a Finance Approver!"


  Scenario: Pending income
    Given I am a logged in finance approver
      And there is an income pending approval
      And I am at the homepage
    Then I should see "Pending"

  Scenario: Verifying Income
    Given I am a logged in finance approver
      And there is an income pending approval
      And I am at the homepage
    When I click "Verify"
    Then I should see "Verified"

  Scenario: Rejecting Income
    Given I am a logged in finance approver
      And there is an income pending approval
      And I am at the homepage
    When I click "Reject"
    Then I should see "Rejected" 


  Scenario: Pending expense
    Given I am a logged in finance approver
      And there is an expense pending approval
      And I am at the homepage
    Then I should see "Pending"

  Scenario: Verifying expense
    Given I am a logged in finance approver
      And there is an expense pending approval
      And I am at the homepage
    When I click "Verify"
    Then I should see "Verified"

  Scenario: Rejecting expense
    Given I am a logged in finance approver
      And there is an expense pending approval
      And I am at the homepage
    When I click "Reject"
    Then I should see "Rejected" 

