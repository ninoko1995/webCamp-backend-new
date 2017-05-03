class Form::Book < Book
  REGISTRABLE_ATTRIBUTES = %i(body title)
  has_many :book_type, class_name: 'Form::BookType'

  after_initialize { book_types.build unless self.persisted? || book_types.present? }
  before_validation :calculate_sum

  private

  def calculate_sum
    book_types.each(&:calculate_order_detail_price)
    self.num += 1 
  end
end