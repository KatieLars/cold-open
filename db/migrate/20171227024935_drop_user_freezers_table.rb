class DropUserFreezersTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_freezers
  end
end
