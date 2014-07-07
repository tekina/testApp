require 'rails_helper'

RSpec.describe "LoginTests", :type => :request do
  describe "GET /login_tests" do
    it "works! (now write some real specs)" do
      get login_tests_path
      expect(response.status).to be(200)
    end
  end
end
