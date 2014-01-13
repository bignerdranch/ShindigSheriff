Feature: Signing In
  Scenario: Successfully signing in
    Given I am the current user
      | ID                   | Input                     |
      | first_name           | Kara                      |
      | last_name            | Thrace                    |
      | email                | kara.thrace@caprica.com   |
      | phone_number         | 555-555-5555              |
      | password             | password                  |

      And I am at the homepage
    When I complete the form with the following:

      | ID               | Input                       |
      | signin-email     | kara.thrace@caprica.com     |
      | signin-password  | password                    |

      And I click Sign In
  Then I see a welcome message
