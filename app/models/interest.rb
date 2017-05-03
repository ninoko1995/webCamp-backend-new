class Interest < ApplicationRecord
	default_scope -> { order(created_at: :desc) }
	
	belongs_to :user
	belongs_to :type

	validates :user_id,presence: true
	validates :type_id,presence: true
	validates :type_id, :uniqueness => { :scope => [:user_id] }
end
