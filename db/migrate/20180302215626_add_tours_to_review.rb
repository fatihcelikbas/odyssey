class AddToursToReview < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :tour, foreign_key: true
  end
end
