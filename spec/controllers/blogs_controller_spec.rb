require 'spec_helper'

include Devise::TestHelpers                          
include Warden::Test::Helpers                        
Warden.test_mode!                                    

# user = FactoryGirl.create(:user)
# login_as(user, :scope => :user)

RSpec.describe BlogsController, :type => :controller do
	# login_user

def login_user
  @user = FactoryGirl.create(:user)  
  sign_in @user
end

	# user = FactoryGirl.create(:user)
	# login_as(user, :scope => :user)

	it "should have a current_user" do
		login_user
    subject.current_user.should_not be_nil
    # Warden.test_reset!
  end

	# logout(:user)

	describe "GET index" do
    it "has a 200 status code" do
      login_user
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET new" do
  	it "has a 200 status code" do
      login_user
      get :new
      expect(response.status).to eq(200)
    end
  end

	# login_as(user, :scope => :user)

  describe "POST create" do
		it "redirects to blog index page" do
			login_user
    	post :create, blog: FactoryGirl.attributes_for(:blog)
  		expect(response.status).to eq(302) #redirect_to blog/:id
    end
  end
end
