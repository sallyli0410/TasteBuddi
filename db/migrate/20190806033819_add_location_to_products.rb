class AddLocationToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :location_lat, :float
    add_column :products, :location_long, :float
  end
end
