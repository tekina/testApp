Given(/^I am an authenticated user$/) do
	user = FactoryGirl.create(:user)
  visit new_user_session_path#'/users/sign_in'
  fill_in "Email", :with => user.email
  fill_in "Password", :with => user.password
  click_button "Sign in"
	expect(page).to have_text("Signed in successfully.")
end

Given(/^I have no blogs$/) do
	Blog.delete_all
end

# Given(/^I can create blog$/) do
# 	# Blog.new
# 	User.exists? == true
# end

When(/^I follow "(.*?)"$/) do |arg1|
	# visit blogs_path
	click_link(arg1)
end

And(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  # visit new_blog_path
  fill_in arg1, with: arg2
end

When(/^I press "(.*?)"$/) do |arg1|
	click_button arg1
end

Then(/^I should see "(.*?)"$/) do |arg1|
	expect(page).to have_text(arg1)
end

Given(/^I have created a blog$/) do
  step %Q{I follow "New Blog"}
	step %Q{I fill in "Post" with "Illo qui voluptas. Id sit quaerat enim aut cupiditate voluptates dolorum."}
	step %Q{I fill in "Summary" with "Post Summary"}
	step %Q{I press "Create Blog"}
	step %Q{I should see "Blog was successfully created."}
end
