class AddUserIdToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :userid, :integer
  end
end
