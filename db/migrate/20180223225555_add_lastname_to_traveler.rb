class AddLastnameToTraveler < ActiveRecord::Migration[5.1]
  def change
    add_column :travelers, :lastname, :string
  end
end
