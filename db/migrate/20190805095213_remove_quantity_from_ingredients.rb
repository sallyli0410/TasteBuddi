class RemoveQuantityFromIngredients < ActiveRecord::Migration[5.2]
  def change
    remove_column :ingredients, :quantity
  end
end
