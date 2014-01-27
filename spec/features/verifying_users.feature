Feature: Verifying a user registered through email

  Scenario: Completing verification through password change
    Given I am an unverified user registered through email
      And I sign in
    When my temporary password matches
      And I click "Submit"
    Then I should see "password has successfully been updated!"

  Scenario: Unmatched temporary password
    Given I am an unverified user registered through email
      And I sign in
    When my temporary password does not match
      And I click "Submit"
    Then I should see "There was a problem changing your temporary password"

  Scenario: blank form
    Given I am an unverified user registered through email
      And I sign in
    When I do not complete the form
      And I click "Submit"
    Then I should see "There was a problem changing your temporary password"

    