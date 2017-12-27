class ChangeTypeColumnNameFreezer < ActiveRecord::Migration[5.1]
  def change
    remove_column :freezers, :type
    add_column :freezers, :freezer_type, :string
  end
end
