class AddFirstnameToTraveler < ActiveRecord::Migration[5.1]
  def change
    add_column :travelers, :firstname, :string
  end
end
