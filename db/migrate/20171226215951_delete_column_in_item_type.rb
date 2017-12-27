class DeleteColumnInItemType < ActiveRecord::Migration[5.1]
  def change
    remove_column :item_types, :storage_time
  end
end
