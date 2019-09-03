class RecipeCard 
    @@all = [] 
    attr_reader :date, :rating, :user, :recipe, :time
    def initialize(rating, user, recipe)
        @date = Time.now.strftime('%F')
        @rating = rating 
        @user = user 
        @recipe = recipe
        @@all << self 
        @time = Time.now.to_i
    end 

    def self.all 
        @@all 
    end 

end 

