class CreateWishlists < ActiveRecord::Migration[5.1]
  def change
    create_table :wishlists do |t|
      t.integer :tour_id
      t.integer :traveler_id

      t.timestamps
    end
  end
end
