
class Ingredient
    @@all = []
    attr_reader :name

    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def self.all
        @@all
    end 

    def self.most_common_allergen
        bad_ingre = Allergy.all.map {|allergy| allergy.ingredient}
        bad_ingre.max_by {|i| bad_ingre.count(i)}
    end 
end 

