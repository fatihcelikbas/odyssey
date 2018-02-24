class AddFieldsToTraveler < ActiveRecord::Migration[5.1]
  def change
    add_column :travelers, :provider, :string
    add_column :travelers, :uid, :string
    add_column :travelers, :image, :string
  end
end
