require 'spec_helper'
require 'faker'

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
	it "is valid if post is longer than 50 characters" do
		FactoryGirl.build(:blog, post: Faker::Lorem.characters(51)).should be_valid
	end
	it "is invalid if summary is longer than 40 characters" do
		FactoryGirl.build(:blog, summary: Faker::Lorem.characters(41)).should_not be_valid
	end
end
