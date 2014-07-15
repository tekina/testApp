require 'faker'

FactoryGirl.define do
	factory :user do
		email Faker::Internet.email
		password "987654321"
	end
end