class AddColumnItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :item_type_id, :integer
  end
end
