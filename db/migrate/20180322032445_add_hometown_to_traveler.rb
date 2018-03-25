class AddHometownToTraveler < ActiveRecord::Migration[5.1]
  def change
    add_column :travelers, :hometown, :string
  end
end
