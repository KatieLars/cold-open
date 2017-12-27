class CreateItemTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :item_types do |t|
      t.string :title
      t.datetime :storage_time
      t.integer :item_id

      t.timestamps
    end
  end
end
