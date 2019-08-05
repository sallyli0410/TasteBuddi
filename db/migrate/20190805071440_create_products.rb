class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :location_lat
      t.string :location_long
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
