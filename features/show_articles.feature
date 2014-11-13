Feature: Show articles
  In order to learn new information
  As a user
  I want to see articles

  Scenario: Show List of Articles
    Given Blog has articles titled BDD is Fun, Testing with Rspec
    When I go to the list of articles
    Then I must see "BDD is Fun"
    And I must see "Testing with Rspec"

  Scenario: Show Single Article
    Given I have article with title "BDD" and content "is Fun" 
    And I am on the list of articles
    When I go to article titled "BDD"
    Then I must see "BDD"
    And I must see "is Fun"
