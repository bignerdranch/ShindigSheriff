Feature: Registering a new user by Email

  Scenario: Successfully Registering a Finance Approver
    Given I am a logged in user
      And I am at the Select A Finance Approver page
    When I click "Invite a new Finance Approver by Email"
      And I complete the form with the following:

      | ID                        | Input                     |
      | user_first_name           | Helo                      |
      | user_last_name            | Agathon                   |
      | user_email                | helo@caprica.com          |
      | user_phone_number         | 555-555-5555              |

    When I click "Register User"
    Then I should see "helo@caprica.com has been sent an email verification"