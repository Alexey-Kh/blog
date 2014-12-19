Feature: Core interface
  In order to feel comfortable on site
  As a user
  I want the site to have core interface

  Scenario: Navigation bar
  When I go to the home page
  Then I should see navigation bar with links: blog, Home, About me, Log in, Sign up

  Scenario: Side bar
  When I go to the home page
  Then I should see sidebar with elements: photo, description, links

  Scenario: Footer
  When I go to the home page
  Then I should see footer

  Scenario: Click on 'BLOG'
  Given I am on the home page
  When I click on "blog"
  Then I should see "home" page

  Scenario: Click on 'Home'
  Given I am on the home page
  When I click on "Home"
  Then I should see "home" page

  # Scenario: Click on 'About me'
  # Given I am on the home page
  # When I click on "About me"
  # Then I should see "About me" page