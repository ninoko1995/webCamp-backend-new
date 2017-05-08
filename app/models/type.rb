class Type < ApplicationRecord
	has_many :book_types
	has_many :interests
	
	has_many :books ,through: :book_types
	has_many :users ,through: :interests
end
