class Blog < ActiveRecord::Base
	belongs_to :user
	validates :user_id, :post, :summary, presence: true 
end