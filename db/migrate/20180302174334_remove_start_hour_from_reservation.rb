class RemoveStartHourFromReservation < ActiveRecord::Migration[5.1]
  def change
    remove_column :reservations, :start_hour, :datetime
  end
end
