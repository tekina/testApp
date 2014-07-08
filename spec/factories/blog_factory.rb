require 'faker'

FactoryGirl.define do
	factory :blog do
		user_id Faker::Number.digit
		post Faker::Lorem.characters(51)
		summary Faker::Lorem.characters(11)
	end
end