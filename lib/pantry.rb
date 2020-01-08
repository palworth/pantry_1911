require './lib/recipe'

class Pantry
  attr_reader :stock
  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    @stock[ingredient] = Recipe.ingredients
    require "pry"; binding.pry
  end
end
