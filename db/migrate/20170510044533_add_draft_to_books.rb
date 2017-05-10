class AddDraftToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :draft, :boolean
  end
end
