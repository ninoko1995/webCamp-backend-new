class CreateInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :interests do |t|
      t.integer :user_id
      t.integer :type_id

      t.timestamps
    end
    add_index :interests, [:user_id, :type_id], unique: true
  end
end
