class Recipe
    @@all = []
    attr_reader :name 
    
    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def self.all 
        @@all
    end 

    def self.most_popular
        recipes = RecipeCard.all.map {|card| card.recipe}
        recipes.max_by {|i| recipes.count(i)}
    end 

    def recipes_cards
        RecipeCard.all.select {|card| card.recipe == self}
    end

    def users 
        recipes_cards.map {|card| card.user}
    end 

    def ingredients 
        recingre = RecipeIngredient.all.select {|ingre| ingre.recipe == self}
        recingre.map {|recingre| recingre.ingredient}
    end 


    def allergens 
        bad_ingre = Allergy.all.map {|allergy| allergy.ingredient}.uniq
        ingredients.select {|ingre| bad_ingre.include?(ingre)}
    end 

    def add_ingredients(ingredient_arr)
        ingredient_arr.each do |ingre|
            RecipeIngredient.new(ingre, self)
        end 
    end 

end 

