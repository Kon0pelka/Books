class AddColumsToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :book_id, :integer
    add_index :comments, :book_id
    add_column :comments, :user_id, :integer
    add_index :comments, :user_id
  end
end
