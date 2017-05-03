class BookType < ApplicationRecord
	default_scope -> { order(created_at: :desc) }
	
	belongs_to :book
	belongs_to :type

	validates :book_id,presence: true
	validates :type_id,presence: true
	validates :type_id, :uniqueness => { :scope => [:book_id] }
end
