require 'faker'

FactoryGirl.define do
  factory :comment do
    content Faker::Lorem.sentence
    commentable_id "2"
    commentable_type "Blog"
  end
end
