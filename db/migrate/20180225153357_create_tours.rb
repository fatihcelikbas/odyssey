class CreateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :tours do |t|
      t.integer :price
      t.integer :duration
      t.integer :max_persons
      t.string :title
      t.string :description
      t.string :city
      t.boolean :is_outdoors
      t.boolean :is_nightlife
      t.boolean :is_foodie
      t.boolean :is_daytrip
      t.boolean :is_landmarks
      t.boolean :is_museums
      t.boolean :active
      t.references :guide, foreign_key: true

      t.timestamps
    end
  end
end
