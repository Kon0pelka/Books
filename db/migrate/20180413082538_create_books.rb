class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :picture
      t.text :description
      t.references :autor, foreign_key: true
      t.timestamps
    end
    add_foreign_key :books, :autors
    add_index :books, [:autor_id, :created_at]
  end
end
