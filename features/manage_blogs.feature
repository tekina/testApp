Feature: Manage Blogs
	In order to make a blog
	As a user
	I want to create and manage blogs

	Scenario: Create Valid Blogs
		Given I am an authenticated user
		Given I have no blogs
		When I follow "New Blog"
		And I fill in "Post" with "Illo qui voluptas. Id sit quaerat enim aut cupiditate voluptates dolorum. Porro necessitatibus numquam dolor quia earum.random data now."
		And I fill in "Summary" with "Post Summary"
		And I press "Create Blog"
		Then I should see "Blog was successfully created."

	Scenario: Edit a blog