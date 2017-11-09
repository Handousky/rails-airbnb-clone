class AddReviewToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :review, foreign_key: true
  end
end
