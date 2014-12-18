Feature:  Making a post
  In order to chat on the sculpt ficiton forum
  As an enthusiast
  I want to be view a form

Scenario: Making a post to madmax forum
  Given a user has already been created
  Given I am on the homepage
  And I follow "Login/joinUs"
  And I fill in "signInEmail" with "test@test.com"
  And I fill in "signInPassword" with "test"
  And I press "Sign in"
  And I follow "Mad Max forum"
  And I fill in "comment" with "This is a Mad Max comment"
  And I press "Post"
  Then I should see "This is a comment"
  And I follow "Chat"
  And I follow "Donatello forum"
  Then I should not see "This is a Mad Max comment"

Scenario: Making a post to Donatello forum
  Given a user has already been created
  Given I am on the homepage
  And I follow "Login/joinUs"
  And I fill in "signInEmail" with "test@test.com"
  And I fill in "signInPassword" with "test"
  And I press "Sign in"
  And I follow "Donatello forum"
  And I fill in "comment" with "This is a Donatello comment"
  And I press "Post"
  Then I should see "This is a comment"
  And I follow "Chat"
  And I follow "Mad Max forum"
  Then I should not see "This is a Donatello comment"

Scenario: Making a post to Upcoming forum
  Given a user has already been created
  Given I am on the homepage
  And I follow "Login/joinUs"
  And I fill in "signInEmail" with "test@test.com"
  And I fill in "signInPassword" with "test"
  And I press "Sign in"
  And I follow "Upcoming forum"
  And I fill in "comment" with "This is a upcoming comment"
  And I press "Post"
  Then I should see "This is a upcoming comment"
  And I follow "Chat"
  And I follow "Mad Max forum"
  Then I should not see "This is a upcoming comment"
