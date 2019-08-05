class AddCompletedToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :completed, :boolean
  end
end
