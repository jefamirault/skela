Feature: Shifts
  In order to keep track of work spent on skela
  As a developer
  I want to log my time worked with shifts

  Scenario: Create unassigned shift
    Given I am a skela user
    Then I can create an unassigned shift for next Friday from 12pm to 4pm

  Scenario: Schedule shift in advance
    Given I do not have any shift tomorrow from 9am to 5pm
    Then I can schedule a shift tomorrow from 9am to 5pm

  Scenario: Log time worked at the end of a shift
    Given I do not have a shift in the last 4 hours
    Then I can create a 4 hour shift that ends now

  Scenario: Assign a task to a shift
    Given I have an upcoming shift
    Then I can create a todo item for that shift

  Scenario: Log a completed task during a shift
    Given I am on a shift
    Then I can create a complete todo item for my shift
