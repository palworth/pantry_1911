class Recipe
  attr_reader :name, :ingredients_required
  def initialize(name)
    @name = name
    @ingredients_required = {}
  end
  def add_ingredient(ingredient, amount_required)
    @ingredients_required[ingredient] = amount_required

  end

  def amount_required(ingredient_id)
    @ingredients_required[ingredient_id]
  end

  def total_calories
    @ingredients_required
    require "pry"; binding.pry

  end
end
