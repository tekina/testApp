require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

RSpec.describe BlogsController, :type => :controller do
	# login_user

def login_user(user)
    sign_in user
end

	# user = FactoryGirl.create(:user)
	# login_as(user, :scope => :user)

	it "should have a current_user" do
		login_user(FactoryGirl.create(:user))
    subject.current_user.should_not be_nil
    # Warden.test_reset!
  end

	# logout(:user)

	describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET new" do
  	it "has a 200 status code" do
      get :new
      expect(response.status).to eq(200)
    end
  end

	# login_as(user, :scope => :user)

  describe "POST create" do
		it "has a 200 status code" do
			login_user(FactoryGirl.create(:user))
    	get :create
  		expect(response.status).to eq(200)
  		  # Warden.test_reset!
    end
  end

end
