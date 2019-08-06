class DeleteDateTimeFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :date
    remove_column :bookings, :time
  end
end
