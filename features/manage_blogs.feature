Feature: Manage Blogs
	In order to make a blog
	As a user
	I want to create and manage blogs

	Scenario: Create a valid Blog
		Given I am an authenticated user
		Given I have no blogs
		When I follow "New Blog"
		And I fill in "Post" with "Illo qui voluptas. Id sit quaerat enim aut cupiditate voluptates dolorum. Porro necessitatibus numquam dolor quia earum.random data now."
		And I fill in "Summary" with "Post Summary"
		And I press "Create Blog"
		Then I should see "Blog was successfully created."

	Scenario: Create an invalid Blog
		Given I am an authenticated user
		Given I have no blogs
		When I follow "New Blog"
		And I fill in "Post" with "Illo qui voluptas. Id sit quaerat enim aut cupiditate voluptates dolorum. Porro necessitatibus numquam dolor quia earum.random data now."
		And I fill in "Summary" with "Summary"
		And I press "Create Blog"
		Then I should see "1 error prohibited this blog from being saved"


	Scenario: Edit a blog with valid details
		Given I am an authenticated user
		Given I have created a blog
		When I follow "Edit"
		And I fill in "Post" with "Illo qui voluptas. Id sit quaerat enim aut cupiditate voluptates dolorum. Porro necessitatibus numquam dolor quia earum."
		And I press "Update Blog"
		Then I should see "Blog was successfully updated."

	Scenario: Edit a blog with invalid details
		Given I am an authenticated user
		Given I have created a blog
		When I follow "Edit"
		And I fill in "Post" with "Illo qui voluptas."
		And I press "Update Blog"
		Then I should see "1 error prohibited this blog from being saved"

	Scenario: "Delete a blog"
		Given I am an authenticated user
		Given I have created a blog
		When I follow "Back"
		When I follow "Destroy"
