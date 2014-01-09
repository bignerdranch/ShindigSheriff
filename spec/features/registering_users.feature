Feature: Registering as a new user

  Scenario: Succesfully creating a new user
    Given I am a non-registered user
    When I complete the form with the following:
      
      | First Name  | Kara                     |
      | Last Name   | Thrace                   |
      | Email       | kara.thrace@caprica.com  |
      | Password    | password                 |  

      And I click "Register Me"
    Then I should see "Welcome Kara!"


  Scenario: Submitting an incomplete registration form
    Given I am a non-registered user
    When I complete the form with the following:

      | First Name  | Kara                     |
      | Last Name   | Thrace                   |
      | Email       | kara.thrace@caprica.com  |

      And I click "Register Me"
    Then I should see "Form Incomplete"


  Scenario: Attempting to register pre-existing user
    Given there is a user email "kara.thrice@caprica.com"
    When I complete the form with the following:

      | First Name  | Kara                     |
      | Last Name   | Thrace                   |
      | Email       | kara.thrace@caprica.com  |
      | Password    | password                 |

      And I click "Register Me"
    Then I should see "kara.thrice@caprica.com is already registered"

    