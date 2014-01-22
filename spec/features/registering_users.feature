Feature: Registering as a new user

  Scenario: Incomplete user form
    Given I am at the homepage
    When I complete the form with the following:
      
      | ID                        | Input                     |
      | user_last_name            | Thrace                    |
      | user_email                | kara.thrace@caprica.com   |
      | user_phone_number         | 555-555-5555              |
      | user_password             | password                  |  
      | user_organization_name    | Galactica Meetup          |      
      
      And I select the role "organizer"
    When I click "Create Account"
    Then I should see "First name can't be blank"

  Scenario: No role declared
    Given I am at the homepage
    When I complete the form with the following:
      
      | ID                        | Input                     |
      | user_first_name           | Kara                      |
      | user_last_name            | Thrace                    |
      | user_email                | kara.thrace@caprica.com   |
      | user_phone_number         | 555-555-5555              |
      | user_password             | password                  |  
      | user_organization_name    | Galactica Meetup          |   

      And I do not select a role
    When I click "Create Account"
    Then I should see "Roles can't be blank"

  Scenario: Succesfully creating a new organizer
    Given I am at the homepage
    When I complete the form with the following:
      
      | ID                        | Input                     |
      | user_first_name           | Kara                      |
      | user_last_name            | Thrace                    |
      | user_email                | kara.thrace@caprica.com   |
      | user_phone_number         | 555-555-5555              |
      | user_password             | password                  |  
      | user_organization_name    | Galactica Meetup          |      

      And I select the role "organizer"
    When I click "Create Account"
    Then I should see "kara.thrace@caprica.com"


  Scenario: Incomplete organization form for new organizer
    Given I am at the homepage
    When I complete the form with the following:
      
      | ID                        | Input                     |
      | user_first_name           | Kara                      |
      | user_last_name            | Thrace                    |
      | user_email                | kara.thrace@caprica.com   |
      | user_phone_number         | 555-555-5555              |
      | user_password             | password                  |     

      And I select the role "organizer"
    When I click "Create Account"
    Then I should see "Organizations name can't be blank"


  Scenario: Registering an existing user
    Given the organizer user:

      | ID                   | Input                       |
      | first_name           | Bill                        |
      | last_name            | Adama                       |
      | email                | bill.adama@galactica.com    |
      | phone_number         | 555-555-5555                |
      | password             | password                    | 

    When I am at the homepage
      And I complete the form with the following:
      
      | ID                        | Input                       |
      | user_first_name           | Bill                        |
      | user_last_name            | Adama                       |
      | user_email                | bill.adama@galactica.com    |
      | user_phone_number         | 555-555-5555                |
      | user_password             | password                    |  
      | user_organization_name    | Galactica Meetup            |      

      And I select the role "organizer"
    When I click "Create Account"
    Then I should see "Email has already been taken"


 Scenario: Succesfully creating a new Finance Approver
    Given I am at the homepage
    When I complete the form with the following:
      
      | ID                        | Input                     |
      | user_first_name           | Little                    |
      | user_last_name            | Mermaid                   |
      | user_email                | ariel@mermaids.com        |
      | user_phone_number         | 555-555-5555              |
      | user_password             | password                  |       

      And I select the role "finance approver"
    When I click "Create Account"
    Then I should see "ariel@mermaids.com"


  Scenario: Creating Finance Approver without changing Organization count
    Given I am at the homepage
    When I complete the form with the following:
      
      | ID                        | Input                     |
      | user_first_name           | Little                    |
      | user_last_name            | Mermaid                   |
      | user_email                | ariel@mermaids.com        |
      | user_phone_number         | 555-555-5555              |
      | user_password             | password                  |   
      | user_organization_name    | Galactica Meetup          |          

      And I select the role "finance approver"
    Then organizations count should not change when I click Create Account