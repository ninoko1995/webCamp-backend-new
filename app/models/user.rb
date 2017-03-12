class User < ApplicationRecord

	#devise用の機能
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #投稿機能
  has_many :books

  #写真登録機能
  mount_uploader :image, ImageUploader 
  
  #favorite機能
  has_many :favorites
  has_many :favorite_books,through: :favorite, source: :book

  #comment機能
  has_many :comments

  #follow機能
		#followする側から見たもの
		has_many :active_relationships, class_name:  "Relationship",
	                                  foreign_key: "follower_id",
	                                  dependent:   :destroy
		has_many :followings, through: :active_relationships, source: :followed                                  

		#followされる側からみたもの
		has_many :passive_relationships, class_name:  "Relationship",
	                                   foreign_key: "followed_id",
	                                   dependent:   :destroy
		has_many :followers, through: :passive_relationships, source: :follower                                   
 
 	#validation
  validates :name ,presence: true , length: {maximum: 10 , minimum: 2}
  validates :introduction , length: {maximum: 100}
  
  def followed_by?(user)
      !passive_relationships.find_by(follower_id: user.id).blank?
  end

end