Feature: Show articles
  In order to learn new information
  As a user
  I want to see articles

  Scenario: Show List of Articles
    Given Blog has articles titled BDD is Fun, Testing with Rspec
    When I go to the home page
    Then I should see string "BDD is Fun"
    And I should see string "Testing with Rspec"

  Scenario: Show Single Article
    Given I have article with title "BDD" and content "is Fun" 
    And I am on the home page
    When I go to article titled "BDD"
    Then I should see string "BDD"
    And I should see string "is Fun"

  Scenario: Show articles pagination
    Given Blog has 11 articles
    When I go to the home page
    Then I should see articles pagination
    And I should see first 10 articles
