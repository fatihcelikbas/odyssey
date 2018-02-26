class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :traveler, foreign_key: true
      t.references :tour, foreign_key: true
      t.datetime :start_date
      t.datetime :start_hour
      t.integer :price
      t.integer :total

      t.timestamps
    end
  end
end
