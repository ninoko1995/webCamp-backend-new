class Favorite < ApplicationRecord
	#データベースから取ってくるときの時間順を指定
	default_scope -> { order(created_at: :desc) }

	belongs_to :user
	belongs_to :book
end
