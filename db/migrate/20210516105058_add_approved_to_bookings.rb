class AddApprovedToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :approved, :boolean
  end
end
