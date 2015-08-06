class CreateWins < ActiveRecord::Migration
  def change
    create_table :wins do |t|
      t.text :body
      t.boolean :active
      t.timestamps
    end
  end
end
