class CreateInterimTables < ActiveRecord::Migration[5.1]
  def change
    create_table :interim_tables do |t|
      t.integer :book_id
      t.integer :user_id

      t.timestamps
    end
    add_index :interim_tables, :book_id
    add_index :interim_tables, :user_id
    add_index :interim_tables, [:book_id, :user_id], unique: true
  end
end
