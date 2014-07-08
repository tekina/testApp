require 'faker'

FactoryGirl.define do
	factory :user do
		email Faker::Internet.email
		password "secret123"
	end

	factory :blog do
		user_id Faker::Number.digit
		post Faker::Lorem.paragraph
		summary Faker::Lorem.sentence
	end
end