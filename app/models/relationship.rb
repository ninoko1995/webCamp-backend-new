class Relationship < ApplicationRecord
	#データベースから取ってくるときの時間順を指定
	default_scope -> { order(created_at: :desc) }
	
	belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, presence: true
  validates :followed_id, presence: true
  validate :cannot_self_follow

  def cannot_self_follow
  	if follower_id == followed_id
  		errors.add(:relationship,"You cannot follow yourself!")
  	end
  end
end
