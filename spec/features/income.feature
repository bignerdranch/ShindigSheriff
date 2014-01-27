Feature: Adding a new income

  Scenario: Succesfully creating a new income
    Given I am a logged in user with an event
      And I am at the event new income page
    When I complete the form with the following:

      | ID                        | Input                     |
      | income_estimated_amount   | 20.00                     |
      | income_category_details   | top hats                  |   

      And I click "Add Income"
    Then I should see "$20.00"

  Scenario: Incomplete form
    Given I am a logged in user with an event
      And I am at the event new income page
    When I complete the form with the following:

      | ID                        | Input                     |
      | income_estimated_amount   | 20.00                     |

      And I click "Add Income"
    Then I should see "Category details can't be blank"


  Scenario: Succesfully deleting an existing income
    Given I am a logged in user with an income
      And I am at the homepage
    When I click "Delete"
    Then I should see "has been deleted"