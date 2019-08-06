class DeleteLocationFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :location_long
    remove_column :products, :location_lat
  end
end
