class UpdateLanguagesForTraveler < ActiveRecord::Migration[5.1]
  def change
    change_column :travelers, :languages, :string, array: true, default: '{"", English, Spanish}'
  end
end
