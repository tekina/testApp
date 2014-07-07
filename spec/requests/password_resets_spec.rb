require 'spec_helper'

RSpec.describe "PasswordResets", :type => :request do
	it "emails user when requesting passsword reset" do
		user = Factory(:user)
		visit login_path
		click_link "password"
		fill_in "Email", :with => user.email
		click_button "Reset Password"
	end
end
