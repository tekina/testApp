require 'rails_helper'

RSpec.describe "LoginTests" do
	it "creates a new user" do
		user = FactoryGirl.create(:user)
		visit new_user_session_path
		click_link "Sign up"
		fill_in "Email", :with => user.email
		fill_in "Password", :with => user.password
		fill_in "confirm", :with => user.password
		click_button "Sign up"
	end
end
