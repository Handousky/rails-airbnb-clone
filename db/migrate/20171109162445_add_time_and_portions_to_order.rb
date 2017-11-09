class AddTimeAndPortionsToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :time, :string
    add_column :orders, :portions, :integer
  end
end
