class AddColumnToItemType < ActiveRecord::Migration[5.1]
  def change
    add_column :item_types, :storage_min, :datetime
    add_column :item_types, :storage_max, :datetime
  end
end
