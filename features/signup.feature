Feature:
  In order to sign up and talk with users
  As a interested party
  I want to be able to sign up

Scenario: Signing up correctly
  Given I am on the homepage
  And I follow "Login/joinUs"
  And fill in "name" with "Dean"
  And fill in "email" with "example@example.com"
  And I fill in "password" with "secret123"
  And I fill in "password_confirmation" with "secret123"
  And I press "Sign up"
  Then I should see "Welcome: Dean"

Scenario: Signing in and out correctly
  Given a user has already been created
  Given I am on the homepage
  And I follow "Login/joinUs"
  And I fill in "signInEmail" with "test@test.com"
  And I fill in "signInPassword" with "test"
  And I press "Sign in"
  Then I should see "Welcome,"
  And I press "Sign out"
  And I follow "Login/joinUs"
  Then I should not see "Welcome,"