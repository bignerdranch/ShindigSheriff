Feature: Signing In
  Scenario: Successfully signing in
    Given I am the current user
      | ID                   | Input                     |
      | first_name           | Kara                      |
      | last_name            | Thrace                    |
      | email                | kara.thrace@caprica.com   |
      | phone_number         | 555-555-5555              |

      And I am at the homepage
    When I complete the form with the following:

      | ID        | Input                       |
      | email     | laura.roslin@galactica.com  |
      | password  | password                    |

      And I click signin
  Then I see a welcome message

