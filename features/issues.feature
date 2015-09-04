Feature: Issues
  In order to facilitate development
  As a Skela developer
  I want to track issues

  Scenario: New Issue
    Given I am a skela admin
    When I create an issue with subject Thing is broken
    Then issue status should be No Task
    And issue should be unassigned

  Scenario: Mark Incomplete
    Given I am a skela admin
    When I create an issue
    And I mark that issue incomplete
    Then issue status should be Incomplete
    And issue should be unassigned

  Scenario: Mark Complete
    Given I am a skela admin
    When I create an issue
    And I mark that issue complete
    Then issue status should be Complete

  Scenario: Assign to User
    Given I am a skela admin
    And there is a user jef
    When I create an issue
    And I assign that issue to jef
    Then issue status should be Incomplete
    And issue assignee should be jef
