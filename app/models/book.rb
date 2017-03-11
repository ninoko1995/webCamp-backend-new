class Book < ApplicationRecord 
	#投稿機能
	belongs_to :user

	#favorite機能
	has_many :favorites, :dependent => :destroy
	has_many :favors,through: :favorites,
	                 source: :user,
	                 dependent:   :destroy

	validates :title, presence: true
	validates :body ,presence: true
end
