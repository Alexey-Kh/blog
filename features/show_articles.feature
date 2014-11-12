Feature: Show articles
  In order to read the information
  As a user
  I want to see articles

  Scenario: Articles List
    Given Blog has articles titled BDD is Fun, Testing with Rspec
    When I go to the list of articles
    Then I must see "BDD is Fun"
    And I must see "Testing with Rspec"
