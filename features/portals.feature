Feature: Portals
  In order to travel between worlds
  As a player
  I want to be able to create portals and use portals

  Scenario:
    Given I have enough mana
    When I am in a world with open portal spaces
    And There is another world with open portal spaces
    Then I can open a portal to the other world
    And I can travel to that world
