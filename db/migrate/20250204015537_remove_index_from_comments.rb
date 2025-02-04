class RemoveIndexFromComments < ActiveRecord::Migration[8.0]
  def change
    remove_index :comments, name: "index_comments_on_user_id"
  end
end
