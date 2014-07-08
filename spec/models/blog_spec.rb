require 'spec_helper'

describe Blog do 
	it "has a valid factory" do
		FactoryGirl.create(:blog).should be_valid
	end
	it "is invalid without User ID" do 
		FactoryGirl.build(:blog, user_id: nil).should_not be_valid
	end
	it "is invalid without post" do
		FactoryGirl.build(:blog, post: nil).should_not be_valid
	end
	it "is invalid without summary" do
		FactoryGirl.build(:blog, summary: nil).should_not be_valid
	end

end