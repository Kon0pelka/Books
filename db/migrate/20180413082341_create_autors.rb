class CreateAutors < ActiveRecord::Migration[5.1]
  def change
    create_table :autors do |t|
      t.string :first_name
      t.string :second_name

      t.timestamps
    end
  end
end
