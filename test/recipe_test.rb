require './lib/ingredient'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'

class RecipeTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new("Cheese", "C", 100)
    @ingredient2 = Ingredient.new("Macaroni", "oz", 30)
    @recipe = Recipe.new("Mac and Cheese")
  end


  def test_it_exists
    assert_instance_of Recipe, @recipe
  end

  def test_it_has_attributes
    assert_equal "Mac and Cheese", @recipe.name
    assert_equal ({}), @recipe.ingredients_required
  end

  def test_it_can_return_ingredients_required
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)
    assert_equal ({@ingredient1 => 2, @ingredient2 =>8}), @recipe.ingredients_required
  end

  def test_it_returns_amount_required
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)
    assert_equal 2, @recipe.amount_required(@ingredient1)
    assert_equal 8, @recipe.amount_required(@ingredient2)
  end

  def test_it_returns_ingredients_array
    assert_equal [],@recipe.ingredients
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)
    assert_equal [@ingredient1, @ingredient2],@recipe.ingredients
  end

  def test_it_calculates_total_calories
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)
    assert_equal 440, @recipe.total_calories
  end

end

# The `total_calories` method should sum the
# calories of each ingredient. The calories for
# each ingredient can be calculated by multiplying
#  the `calories` attribute of the Ingredient by the amount
#  of the ingredient required for the recipe.

# pry(main)> recipe.amount_required(ingredient1)
# # => 2
#
# pry(main)> recipe.amount_required(ingredient2)
# # => 8
#
# pry(main)> recipe.ingredients
# => [#<Ingredient:0x007fe8438c7a70...>, #<Ingredient:0x007fe843857f40...>]
