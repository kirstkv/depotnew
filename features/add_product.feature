Feature: Add Product
In order to add a product
    As a user
    I want to create a product
  
    Scenario: Products List
        Given I have completed the products form properly
        Then I will be directed to the products page
    
    Scenario: Not a known image file
        Given I have inputted an a product
        Then the number of products will increase by 1

  