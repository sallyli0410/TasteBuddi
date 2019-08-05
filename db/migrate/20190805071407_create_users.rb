class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :wx_id
      t.string :wx_name
      t.string :wx_avatar
      t.string :phone_number
      t.boolean :seller_complete

      t.timestamps
    end
  end
end
