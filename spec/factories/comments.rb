require 'faker'

FactoryGirl.define do
  factory :comment do
    content { Faker::Lorem.sentence }
    commentable_id { Faker::Number.digit }
    commentable_type "Blog"
  end
end
