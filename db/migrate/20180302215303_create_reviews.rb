class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :star, default: 1
      t.references :reservation, foreign_key: true
      t.references :tourist, foreign_key: true
      t.references :guide, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
