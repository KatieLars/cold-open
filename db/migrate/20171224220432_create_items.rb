class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.string :type
      t.integer :freezer_id
      t.datetime :date_stored

      t.timestamps
    end
  end
end
