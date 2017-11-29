require('minitest/autorun')
require('minitest/rg')
require_relative('../food.rb')


class TestFood < Minitest::Test

  def setup
    @food1 = Food.new("Pizza", 15, 100)
    @food2 = Food.new("Burger", 10, 50)
  end



end
