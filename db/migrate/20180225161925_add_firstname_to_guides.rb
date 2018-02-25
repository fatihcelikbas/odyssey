class AddFirstnameToGuides < ActiveRecord::Migration[5.1]
  def change
    add_column :guides, :firstname, :string
  end
end
