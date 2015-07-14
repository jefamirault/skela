Feature: Music
  As a musician
  In order to listen to my own music
  I want to upload or record music

  Scenario:
    Given I am a skela user
    When I select a song to upload
    Then I should be able to view that song
    And I should be able to listen to that song
