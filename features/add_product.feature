Feature: Add Product
  In order to add a product
  As a user
  I want to create a product
  
  Scenario: Products List
    Given I have products titled Chocolate, Selection
    When I go to the products page
    Then I should see "Chocolate"
    And I should see "Selection"
  