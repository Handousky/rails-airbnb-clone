class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.integer :price
      t.string :address
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
