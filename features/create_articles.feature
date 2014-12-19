Feature: Create Articles
  In order to increase the amount of visitors
  As an admin
  I want to create articles

  Scenario: Create valid article
    Given I have no articles
    And I am on the home page
    When I click on "New article"
    And I fill in "Title" with "BDD..."
    And I fill in "Content" with "... is a useful thing."
    And I click on "Create"
    Then I should see string "New article created."
    And I should see string "BDD..."
    And I should have 1 article