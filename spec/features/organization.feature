Feature: Organizations

  Scenario: Succesfully creating a new organization
    Given I am a logged in user
      And I am at the new organizations page
    When I complete the form with the following:

      | ID                        | Input                     |
      | organization_name         | Cylon Meetup              |
      | organization_website      | cylons.notaruse.com       |

      And I click "Create Organization"
    Then I should see "Cylon Meetup"

  Scenario: Submitting an incomplete form
    Given I am a logged in user
      And I am at the new organizations page
    When I complete the form with the following:

      | ID                        | Input                     |
      | organization_name         |                           |
      | organization_website      | cylons.notaruse.com       |

      And I click "Create Organization"
    Then I should see "Error(s) while creating organization: Name can't be blank"

  Scenario: Succesfully editing an existing organization
    Given I am a logged in user
      And I am at the edit organization page
    When I complete the form with the following:

      | ID                        | Input                     |
      | organization_name         | Cylon Meetup              |
      | organization_website      | cylons.notaruse.com       |

      And I click "Update Organization"
    Then I should see "Cylon Meetup"
      And I should see "cylons.notaruse.com"

  Scenario: Submitting an incomplete form
    Given I am a logged in user
      And I am at the edit organization page
    When I complete the form with the following:

      | ID                        | Input                     |
      | organization_name         |                           |
      | organization_website      | cylons.notaruse.com       |

      And I click "Update Organization"
    Then I should see "Error(s) while editing organization: Name can't be blank"

  Scenario: Succesfully deleting an organization
    Given I am a logged in user
      And I am at the organization page
    When I click "Destroy Organization"
    Then I should see "has been deleted"
