class User 
    @@all = []
    attr_reader :name 
    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def recipes 
        RecipeCard.all.select {|card| card.user == self}
        .map {|card| card.recipe}
    end 

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(rating, self, recipe)
    end 

    def declare_allergy(ingredient)
        Allergy.new(self, ingredient)
    end 

    def allergens
        Allergy.all.select {|allergy| allergy.user == self}
    end 

    def top_three_recipes
        recipes.sort_by {|card| card.rating} 
        .reverse.take(3)
    end 

    def most_recent_recipe
        RecipeCard.all.select {|card| card.user == self}
        .max_by {|card| card.time}
    end 

    def safe_recipes
        unsafe = allergens.map {|allergy| allergy.ingredient}
        all_recipes = Recipe.all
        RecipeIngredient.all.each do |recipeingre|
            if unsafe.include?(recipeingre.ingredient)
                all_recipes.delete(recipeingre.recipe) 
            end 
        end 
        all_recipes
    end 

end 