class Form::BookType < BookType
  REGISTRABLE_ATTRIBUTES = %i(id book_id type_id _destroy)

  def selectable_products
    Product.all
  end

  def calculate_order_detail_price
    self.price = unit_price * quantity
  rescue
    self.price = 0
  end
end