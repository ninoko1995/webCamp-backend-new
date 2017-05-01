class BookType < ApplicationRecord
	belongs_to :book
	belongs_to :type

	validates :book_id,presence: true
	validates :type_id,presence: true
end
