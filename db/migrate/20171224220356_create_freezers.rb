class CreateFreezers < ActiveRecord::Migration[5.1]
  def change
    create_table :freezers do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
