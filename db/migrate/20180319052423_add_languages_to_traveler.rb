class AddLanguagesToTraveler < ActiveRecord::Migration[5.1]
  def change
    add_column :travelers, :languages, :string, array: true, default: '{English}'
  end
end
