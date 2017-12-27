class RemoveColumnItemIdFromItemType < ActiveRecord::Migration[5.1]
  def change
    remove_column :item_types, :item_id
  end
end
