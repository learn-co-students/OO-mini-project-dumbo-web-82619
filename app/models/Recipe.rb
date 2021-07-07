class Recipe

    attr_accessor :recipe_name

    @@all = []

    def initialize(recipe_name)
        @recipe_name = recipe_name
        @@all << self
    end

    def self.all()
        @@all
    end

    def self.most_popular
        # returns the recipe instance w/ the highest number of users
        recipes = RecipeCard.all().map do |recipe_card|
            recipe_card.recipe
        end
        recipes.max_by{|recipe| recipes.count(recipe)}
    end

    def matches()
        recipe_matches = RecipeCard.all().select do |recipe_card|
            recipe_card.recipe == self
        end
    end

    def users()
        self.matches.map {|recipe_card| recipe_card.user}
    end

    def indredients()
        RecipeIngredient.all().select {|recipe_ingredient| recipe_ingredient.recipe == self }
    end

    def all_allergen_ingredients()
            Allergy.all().map {|allergy| allergy.ingredient}  
    end

    def allergens()
        self.ingredients(). select do |ingredient|
            all_allergen_ingredients().include?(ingredient)
        end
    end

    def add_ingredients(ingredients)
        for ingredient in ingredients do
           RecipeIngredient.new(self, ingredient)
        end
    end



end