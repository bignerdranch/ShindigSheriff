Feature: Registering as a new organization

  Scenario: Succesfully creating a new organization
    Given A non-registered organization
    When I complete the form with the following:
      
      | Name                 | Pegasus                                 |
      | Website              | www.pegasusmeetup.com                   |
      | Contact Name         | Admiral Cain                            |
      | Contact Phone Number | 555-555-5555                            |
      | Contact Email        | AdmiralCain@pegasusmeetup.com           |

      And I click "Register Organization"
    Then I should see "Pegasus Organization has been registered"


  Scenario: Submitting an incomplete registration form
    Given A non-registered organization
    When I complete the form with the following:

      | Name                 | Pegasus                                 |
      | Website              | www.pegasusmeetup.com                   |
      | Contact Name         | Admiral Cain                            |

      And I click "Register Organization"
    Then I should see "Form Incomplete"


  Scenario: Attempting to register pre-existing organization
    Given there is a organization email "kara.thrice@caprica.com"
    When I complete the form with the following:

      | Name                 | Pegasus                                 |
      | Website              | www.pegasusmeetup.com                   |
      | Contact Name         | Admiral Cain                            |
      | Contact Phone Number | 555-555-5555                            |
      | Contact Email        | AdmiralCain@pegasusmeetup.com           |

      And I click "Register Organization"
    Then I should see "Pegasus Organization is already registered"

    

    