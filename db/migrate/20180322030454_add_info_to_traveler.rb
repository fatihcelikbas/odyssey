class AddInfoToTraveler < ActiveRecord::Migration[5.1]
  def change
    add_column :travelers, :occupation, :string
    add_column :travelers, :education, :string
  end
end
