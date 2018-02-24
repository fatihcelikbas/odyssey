class AddConfirmableToDevise < ActiveRecord::Migration[5.1]
  def change
    add_column :travelers, :confirmation_token, :string
    add_column :travelers, :confirmed_At, :datetime
    add_column :travelers, :confirmation_sent_at, :datetime
    
    add_index :travelers, :confirmation_token, unique: true
  end
end
