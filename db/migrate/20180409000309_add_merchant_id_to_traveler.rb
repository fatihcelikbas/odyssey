class AddMerchantIdToTraveler < ActiveRecord::Migration[5.1]
  def change
    add_column :travelers, :merchant_id, :string
  end
end
