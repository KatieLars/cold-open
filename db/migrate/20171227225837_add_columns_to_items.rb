class AddColumnsToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :expiration_max, :datetime
    add_column :items, :expiration_min, :datetime
  end
end
