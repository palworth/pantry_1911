require './lib/pantry'
require './lib/ingredient'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new("Cheese", "C", 100)
    @ingredient2 = Ingredient.new("Macaroni", "oz", 30)
    @recipe = Recipe.new("Mac and Cheese")
    @pantry = Pantry.new
  end
  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_it_has_attributes
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)
    assert_equal ({}), @pantry.stock
  end

  def test_it_can_return_stock_check
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)
    assert_equal 0, @pantry.stock_check(@ingredient1)
  end
end


# ry(main)> recipe.add_ingredient(ingredient1, 2)
#
# pry(main)> recipe.add_ingredient(ingredient2, 8)
#
# pry(main)> pantry.stock
# # => {}
#
# pry(main)> pantry.stock_check(ingredient1)
# # => 0
#
# pry(main)> pantry.restock(ingredient1, 5)
#
# pry(main)> pantry.restock(ingredient1, 10)
#
# pry(main)> pantry.stock_check(ingredient1)
# # => 15
