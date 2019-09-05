class Ingredient

    attr_accessor :ingredient

    @@all = []

    def initialize(ingredient)
        @ingredient = ingredient
        @@all << self
    end

    def self.all
        @@all
    end

    def self.allergen_ingredients
        Allergy.all().map {|allergy| allergy.ingredient.ingredient}
    end

    def self.most_common_allergen
        self.allergen_ingredients().max_by {|ingredient| self.allergen_ingredients().count(ingredient)}
    end

end
