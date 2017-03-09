class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :books
  validates :name ,presence: true , length: {maximum: 10 , minimum: 2}
  validates :introduction , length: {maximum: 100}
end
