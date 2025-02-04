class FixCommentsTableId < ActiveRecord::Migration[8.0]
  def change
    change_column :comments, :id, :integer, primary_key: true
  end
end
