class AddProfileStuffToGuide < ActiveRecord::Migration[5.1]
  def change
    add_column :guides, :phone_number, :string
    add_column :guides, :description, :text
  end
end
