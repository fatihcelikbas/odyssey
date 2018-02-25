class AddStuffToTraveler < ActiveRecord::Migration[5.1]
  def change
    add_column :travelers, :phone_number, :string
    add_column :travelers, :description, :text
  end
end
