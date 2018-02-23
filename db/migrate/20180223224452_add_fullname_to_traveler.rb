class AddFullnameToTraveler < ActiveRecord::Migration[5.1]
  def change
    add_column :travelers, :fullname, :string
  end
end
