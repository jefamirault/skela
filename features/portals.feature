Feature: Portals
  In order to travel between worlds
  As a player
  I want to be able to create portals and use portals

  Scenario: Open Portal to Another World
    Given I have enough mana
    When I am in a world with open portal spaces
    And There is another world with open portal spaces
    Then I can open a portal to the other world
    And I can travel to that world

  Scenario: Open Portal to the East
    Given The portal space to the east is free
    And I have enough mana to create a Portal
    Then I can create a portal to the east
    And I can travel to that world

  Scenario: Open Portal to the West
    Given The portal space to the west is free
    And I have enough mana to create a Portal
    Then I can create a portal to the west
    And I can travel to that world

#  Scenario: Open Portal to a New World
#    Given I have enough mana
#    When I am in a world with open portal spaces
#    Then I can open
