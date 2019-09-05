class User

    attr_accessor :name

    @@all = []

    def initialize (name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def recipe_cards()
        RecipeCard.all().select {|card| card.user == self}
    end

    def recipes()
        self.recipe_cards().map {|card| card.recipe}
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(recipe, self, date, rating)
    end

    def declared_allergy(ingredient)
        Allergy.new(self, ingredient)
    end


    def user_allergy()
        Allergy.all.select {|allergy| allergy.user == self}
    end


    def allergens()
        self.user_allergy().map {|allergy| allergy.ingridient}
    end

    def top_three_recipes()
        self.recipe_cards().sort_by {|card| card.rating}.last(3)
    end

    def most_recent_recipe()
        self.recipe_cards.sort_by{|d| m,d,y=d.split("/");[y,m,d]}.last
    end

#should return all recipes that do not contain 
#ingredients the user is allergic to
    def self.safe_recipes()
        Ingredient.all().select {|ingredient| !Ingredient.allergen_ingredients.include?(ingredient.ingredient)}

    end


end