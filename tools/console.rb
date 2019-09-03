require_relative '../config/environment.rb'

user1 = User.new("John")
user2 = User.new("Tom")

ingre1 = Ingredient.new("Soy")
ingre2 = Ingredient.new("Eggs")
ingre3 = Ingredient.new("Wheat")
ingre4 = Ingredient.new("Vegan Love")

recipe1 = Recipe.new("Cake")
recipe2 = Recipe.new("Edamame")
recipe3 = Recipe.new("Vegan Banana Muffin")

user1.declare_allergy(ingre1)
user1.declare_allergy(ingre3)
user2.declare_allergy(ingre2)
user2.declare_allergy(ingre3)

user1.add_recipe_card(recipe3, "date", 9)
user2.add_recipe_card(recipe3, "date", 8)
user2.add_recipe_card(recipe2, "date", 10)

recipe1.add_ingredients([ingre2, ingre3])
recipe2.add_ingredients([ingre1])
recipe3.add_ingredients([ingre4])

binding.pry
