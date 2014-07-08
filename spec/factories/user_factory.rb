require 'faker'

FactoryGirl.define do
	factory :user do
		email Faker::Internet.email
		password "secret123"
	end
end