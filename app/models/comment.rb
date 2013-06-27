class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
	has_many :votes, as: :voteable

	validates :body, :user_id, :post_id, presence: true
end