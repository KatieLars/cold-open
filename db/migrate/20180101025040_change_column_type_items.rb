class ChangeColumnTypeItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :date_stored, :datetime
    remove_column :items, :expiration_max, :datetime
    remove_column :items, :expiration_min, :datetime
    add_column :items, :date_stored, :time
    add_column :items, :expiration_max, :time
    add_column :items, :expiration_min, :time
  end
end
