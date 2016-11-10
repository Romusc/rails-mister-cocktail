# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ingredient.delete_all
Cocktail.delete_all
Dose.delete_all

ingredients = []

ingredients << Ingredient.create!(name: 'lime juice')
ingredients << Ingredient.create!(name: 'mint')
ingredients << Ingredient.create!(name: 'vodka')
ingredients << Ingredient.create!(name: 'whisky')
ingredients << Ingredient.create!(name: 'sherry')
ingredients << Ingredient.create!(name: 'cinnamon')
ingredients << Ingredient.create!(name: 'coke')
ingredients << Ingredient.create!(name: 'tonic')
ingredients << Ingredient.create!(name: 'soda')
ingredients << Ingredient.create!(name: 'OJ')

10.times do
  cocktail = Cocktail.create!(name: Faker::Superhero.name)
  ingredient = ingredients.sample
  dose = Dose.create!(cocktail_id: cocktail.id,
                  ingredient_id: ingredient.id,
                  description: "#{(1..5).to_a.sample} cl of #{ingredient.name}")
end
