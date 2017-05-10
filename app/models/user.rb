class User < ApplicationRecord
  #データベースから取ってくるときの時間順を指定
  default_scope -> { order(created_at: :desc) }
  
	#devise用の機能
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #投稿機能
  #本物の投稿と、下書きの違い
  has_many :books,-> {where(draft: false)}
  has_many :drafts,->  {where(draft: true)},
                        class_name: 'Book',
                        foreign_key: 'book_id'

  #興味による検索機能
  has_many :interests
  has_many :types,through: :interests

  #写真登録機能
  #アイコン写真
  mount_uploader :image, ImageUploader 
  #ヘッダー画像
  mount_uploader :header_image, HeaderImageUploader 
  
  #favorite機能
  has_many :favorites
  has_many :favorite_books,through: :favorites, source: :book

  #comment機能
  has_many :comments

  #follow機能
		#followする側から見たもの
		has_many :active_relationships, -> {where(accepted: true)},
                                    class_name:  "Relationship",
	                                  foreign_key: "follower_id",
	                                  dependent:   :destroy                                    
		has_many :followings, through: :active_relationships, source: :followed                                  

		#followされる側からみたもの
		has_many :passive_relationships, -> {where(accepted: true)},
                                     class_name:  "Relationship",
	                                   foreign_key: "followed_id",
	                                   dependent:   :destroy
		has_many :followers, through: :passive_relationships, source: :follower                                   

    #フォローリクエスト機能
    has_many :require_relationships,-> {where(accepted: false)},
                                    class_name: "Relationship",
                                    foreign_key: "followed_id",
                                    dependent: :destroy                                  
    has_many :requires, through: :require_relationships,source: :follower
 
 	#validation
  validates :name ,presence: true , length: {maximum: 10 , minimum: 2}

  validates :introduction , length: {maximum: 150}
  
  #userにfollowされているかどうかを判断する
  def followed_by?(user)
    !passive_relationships.find_by(follower_id: user.id).blank?
  end

  #フォロリクが送られていないかどうかを判断する
  def requested_by?(user)
    !require_relationships.find_by(follower_id: user.id).blank?
  end

end
