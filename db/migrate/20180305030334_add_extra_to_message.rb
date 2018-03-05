class AddExtraToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :context, :text
  end
end
