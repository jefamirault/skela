Feature: Portals
  In order to travel between worlds
  As a player
  I want to be able to create portals and use portals

  Scenario: Open Portal to Another World
    Given I am a player in a new world
    And I have enough mana to create a Portal
    Then there should be closed portals
    And I can open a portal to a new world

  Scenario: Open Portal to the East
    Given I am a player in a new world
    And I have enough mana to create a Portal
    Then I can create a portal to the east

  Scenario: Open Portal to the West
    Given I am a player in a new world
    And I have enough mana to create a Portal
    Then I can create a portal to the west

  Scenario: Travel to the East
    Given I am a player in a world with a portal to the east
    Then I can travel through the east portal

  Scenario: Travel to the West
    Given I am a player in a world with a portal to the west
    Then I can travel through the west portal
