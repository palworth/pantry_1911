require './lib/ingredient'

class Recipe
  attr_reader :name, :ingredients_required, :ingredients
  def initialize(name)
    @name = name
    @ingredients_required = {}
    @ingredients = []
  end
  def add_ingredient(ingredient, amount_required)
    @ingredients_required[ingredient] = amount_required
    @ingredients << ingredient

  end

  def amount_required(ingredient_id)
    @ingredients_required[ingredient_id]
  end

  def total_calories
    require "pry"; binding.pry
    cals_per_ing = @ingredients.map {|ing| ing.calories}
    units_per_ing = 1
   
end



end




# @ingredients_required.reduce(Hash.new(0)) do |result, ingredient|
#   result[ingredient[0].name] += ingredient[0].calories
#   result
#   require "pry"; binding.pry
# end
