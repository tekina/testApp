require 'rails_helper'

RSpec.describe Comment, :type => :model do
	it "is invalid without a comment"do
		FactoryGirl.build(:comment, content: nil).should_not be_valid
	end
end