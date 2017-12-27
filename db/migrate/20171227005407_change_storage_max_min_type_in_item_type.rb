class ChangeStorageMaxMinTypeInItemType < ActiveRecord::Migration[5.1]
  def change
    remove_column :item_types, :storage_max
    remove_column :item_types, :storage_min
    add_column :item_types, :storage_max, :string
    add_column :item_types, :storage_min, :string
  end
end
