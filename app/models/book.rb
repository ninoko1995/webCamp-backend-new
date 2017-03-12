class Book < ApplicationRecord 
	#データベースから取ってくるときの時間順を指定
	default_scope -> { order(created_at: :desc) }
	
	#投稿機能
	belongs_to :user

	#favorite機能
	has_many :favorites, :dependent => :destroy
	has_many :favors,through: :favorites,
	                 source: :user,
	                 dependent:   :destroy

	validates :title, presence: true
	validates :body ,presence: true
	validates :user_id ,presence: true
end
