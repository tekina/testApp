require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

def login_user
		user = FactoryGirl.create(:user)
		login_as(user, scope: :user)
end

RSpec.describe "BlogTests" do
	it "creates a new Blog Post" do
		login_user
		blog = FactoryGirl.create(:blog)
		visit new_blog_path
		fill_in "Post", with: blog.post
		fill_in 'Summary', with: blog.summary
		click_button 'Create'
		expect(page).to have_text("Blog was successfully created.")
		logout(:user)
	end

	it "edits and updates a Blog Post" do
		login_user
		blog = FactoryGirl.create(:blog)
		# visit new_blog_path
		# fill_in 'Post', with: blog.post
		# fill_in 'Summary', with: blog.summary
		# click_button 'Create'
		# click_link 'Back'
		visit blogs_path
		page.first(:link, "Edit").click 		# because there may be more than one 'Edit' links
		# click_link "Edit"
		fill_in 'Post', with: blog.post
		click_button "Update"
		expect(page).to have_text("Blog was successfully updated.")
		logout(:user)
	end

	it "deletes a Blog Post" do
		login_user
		blog = FactoryGirl.create(:blog)
		visit new_blog_path
		fill_in 'Post', with: blog.post
		fill_in 'Summary', with: blog.summary
		click_button 'Create'
		click_link 'Back'
		page.first(:link, "Destroy").click 		# because there may be more than one 'Edit' links
		expect(page).to have_text("Blog was successfully deleted.")
		logout(:user)
	end
end