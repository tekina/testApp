require 'faker'

FactoryGirl.define do
	factory :blog do
		user_id '1' 	#Faker::Number.digit
		post Faker::Lorem.characters(51)
		summary Faker::Lorem.characters(11)
	end
end