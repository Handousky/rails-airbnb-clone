  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seeding Meals
puts "Seeding meals into db"
10.times { |i|
  Meal.create(name: i, price: 20 + i, address: "#{i}#{i+1}#{i+2} Whatever St", category: "Italian", description: "Good food")
}
puts "Meals seeded"
