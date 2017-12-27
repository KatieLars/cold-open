class RemoveColumnTypeFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :type
  end
end
