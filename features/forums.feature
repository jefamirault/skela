Feature: Forums
  In order to communicate with other players in a world
  As a player
  I want to create and post in forums

  Scenario: Create Forum
    Given I am a player in a new world
    And there is an outpost in this world
    And I have 50 influence
    And I have 10 supporters
    Then there should not be a forum in this outpost
    And I can create a forum
