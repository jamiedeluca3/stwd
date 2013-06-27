class RenameUseridColumnAgain < ActiveRecord::Migration
  def up
  	rename_column :posts, :userid, :user_id
  end

  def down
  end
end
