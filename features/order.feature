Feature:
  In order to place and order
  As a user
  I want to be able to buy a product

Scenario: Buying mad max correctly
  Given I am on the homepage
  And I visit the madmax product page
  And I follow "ordermax"
  And I fill in "name" with "Dean"
  And I fill in "address_1" with "Birch Drive"
  And I press "Pay with Card"
  Then I should see "Done"
  