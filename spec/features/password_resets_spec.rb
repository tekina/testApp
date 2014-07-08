require 'spec_helper'

RSpec.describe "PasswordResets" do
	it "emails user when requesting password reset" do
		user = FactoryGirl.create(:user)
		visit new_user_session_path
		click_link "password"
		fill_in "Email", :with => user.email
		click_button "reset password"
	end
end
