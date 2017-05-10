class Book < ApplicationRecord 
	#データベースから取ってくるときの時間順を指定
	default_scope -> { order(created_at: :desc) }
	
	#投稿機能
	belongs_to :user

	#本の種類に夜検索機能
	has_many :book_types
	has_many :types,through: :book_types

	#favorite機能
	has_many :favorites, :dependent => :destroy
	has_many :favors,through: :favorites,
	                 source: :user,
	                 dependent:   :destroy

	#comment機能
	has_many :comments,:dependent => :destroy

	validates :title, presence: true
	validates :body ,presence: true, length: {maximum: 200}

	validates :user_id ,presence: true
	
	validates :valuation,presence: true,numericality: {greater_than: 0,less_than: 6} 
	validates :draft,presence: true
end
