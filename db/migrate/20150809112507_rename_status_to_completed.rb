class RenameStatusToCompleted < ActiveRecord::Migration
  def change
    rename_column :wins, :active, :completed
  end
end
