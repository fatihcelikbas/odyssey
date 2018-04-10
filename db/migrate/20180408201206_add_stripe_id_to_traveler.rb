class AddStripeIdToTraveler < ActiveRecord::Migration[5.1]
  def change
    add_column :travelers, :stripe_id, :string
  end
end
