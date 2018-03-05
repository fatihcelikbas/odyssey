class AddInstantToTours < ActiveRecord::Migration[5.1]
  def change
    add_column :tours, :instant, :integer, default: 1
  end
end
