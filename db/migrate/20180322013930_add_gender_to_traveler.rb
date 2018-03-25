class AddGenderToTraveler < ActiveRecord::Migration[5.1]
  def change
    add_column :travelers, :gender, :string
  end
end
