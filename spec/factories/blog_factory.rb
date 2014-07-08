require 'faker'

FactoryGirl.define do
	factory :blog do
		user_id Faker::Number.digit
		post Faker::Lorem.paragraph
		summary Faker::Lorem.sentence
	end
end