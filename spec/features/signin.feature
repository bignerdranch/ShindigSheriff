Feature: Signing In
  Scenario: Successfully signing in
    Given I am a new user
      And I am at the homepage
    When I complete the form with the following:

      | ID               | Input                        |
      | signin-email     | test@testuser123.com         |
      | signin-password  | password123                  |

      And I click "Sign In"
  Then I see a welcome message

