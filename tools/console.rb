require_relative '../config/environment.rb'


alex = User.new("Alex")
john = User.new("John")
james = User.new("James")
silvia = User.new("Silvia")

peanut = Ingredient.new("Peanut")
banana = Ingredient.new("Banana")
milk = Ingredient.new("Milk")
flour = Ingredient.new("Flour")
tomato = Ingredient.new("tomato")

Allergy.new(alex, milk)
Allergy.new(alex, peanut)
Allergy.new(john, milk)
Allergy.new(james, banana)

banana_cake = Recipe.new("Banana cake")
peanut_cake = Recipe.new("Peanut cake")
lasagna = Recipe.new("Lasagna")

RecipeCard.new(banana_cake, silvia, "09/03/2019", 8)
RecipeCard.new(peanut_cake, john, "11/03/2018", 5)
RecipeCard.new(lasagna, alex, "01/01/2015", 9)
RecipeCard.new(lasagna, silvia, "01/09/2018", 10)


RecipeIngredient.new(banana_cake, banana)
RecipeIngredient.new(banana_cake, milk)
RecipeIngredient.new(banana_cake, flour)
RecipeIngredient.new(peanut_cake, peanut)
RecipeIngredient.new(peanut_cake, milk)
RecipeIngredient.new(peanut_cake, flour)
RecipeIngredient.new(lasagna, tomato)







binding.pry
