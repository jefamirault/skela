Feature: Navigation
  As a player
  In order to have a good user experience
  I want to easily navigate and examine

  Scenario:
    Given The east and west portals are open
    When I observe nearby portals
    Then I should see that the east portal is open
    And I should see that the west portal is open
    And I should see that the north portal space is free
    And I should see that the south portal space is free
