class AddUserIdToWins < ActiveRecord::Migration
  def change
    add_column :wins, :user_id, :integer
  end
end
