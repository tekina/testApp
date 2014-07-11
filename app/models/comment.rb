class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true
	validates :content, presence: {message: "Comment content cannot be empty"}
end
