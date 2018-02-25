class AddLastnameToGuides < ActiveRecord::Migration[5.1]
  def change
    add_column :guides, :lastname, :string
  end
end
