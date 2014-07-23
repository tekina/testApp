require 'spec_helper'

# include Devise::TestHelpers                          
include Warden::Test::Helpers                        
Warden.test_mode! 
RSpec.describe Api::V1::SessionsController, type: :controller do

  def login_user
    
  end

  # describe "POST 'create'" do
  #   it "returns status 200" do
  #     @user = FactoryGirl.create(:user)
  #     request_json = {
  #     email: @user.email,
  #     password: @user.password } 
  #     post sign_in, request_json
  #     expect(json['message']).to_not be(nil)
  #     expect(response.status).to eq(200)
  #   end
  # end
  
  #   it "returns http success" do
  #     post :create
  #     expect(response).to be_success
  #   end
  # end

  # describe "GET 'destroy'" do
  #   it "returns http success" do
  #     delete 'destroy'
  #     expect(response).to be_success
  #   end
  # end

end