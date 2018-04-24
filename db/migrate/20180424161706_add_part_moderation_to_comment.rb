class AddPartModerationToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :activ, :boolean, default: false
  end
end
