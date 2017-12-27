class CreateUserFreezers < ActiveRecord::Migration[5.1]
  def change
    create_table :user_freezers do |t|
      t.integer :user_id
      t.integer :freezer_id

      t.timestamps
    end
  end
end
