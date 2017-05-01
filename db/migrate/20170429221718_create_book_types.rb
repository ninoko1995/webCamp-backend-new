class CreateBookTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :book_types do |t|
      t.integer :book_id
      t.integer :type_id

      t.timestamps
    end
  end
end
