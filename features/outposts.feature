Feature: Outposts
  As a player
  In order to expand my influence
  I want to create outposts to new worlds

  Scenario: Create Outpost
    Given I am a player in a new world
    And I have 10 influence
    When I create an outpost
    Then this world should have an outpost
    And I should have 0 influence

  Scenario: Build Lumber Yard
    Given: I have 1 supporter
    Then: I can create an outpost

  Scenario: Create Forum
    Given I am a player in a new world
    And I have 50 influence
    And I have 10 supporters
    Then I can create a forum

  Scenario: Create Tower
    Given I am a player in a new world
    And I have 100 influence
    And I have 20 supporters
    Then I can create a tower
