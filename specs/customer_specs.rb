require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../food.rb')


class TestCustomer < Minitest::Test

  def setup
    @customer1 = Customer.new("Robert", 100, 32, 0)
    @customer2 = Customer.new("Max", 0, 17, 0)
    @drink1 = Drink.new("Lager", 5, 20)
    @drink2 = Drink.new("Vodka", 10, 50)
    @drink3 = Drink.new("Jager", 1, 100)
    @food1 = Food.new("Pizza", 15, 100)
  end

  def test_customer_can_buy_drink
    assert_equal(true, @customer1.can_afford?(@drink2))
  end

  def test_customer_cant_buy_drink
    assert_equal(false, @customer2.can_afford?(@drink2))
  end

  def test_customers_wallet_decreases_with_drink_purchase
    @customer1.buy_drink(@drink2)
    assert_equal(90, @customer1.wallet)
  end

  def test_old_enough_to_buy_drink
    assert_equal(true, @customer1.old_enough?)
  end

  def test_no_old_enough_to_buy_drink
    assert_equal(false, @customer2.old_enough?)
  end

  def test_drunkenness_level_when_drink_bought
    @customer1.buy_drink(@drink2)
    assert_equal(50, @customer1.drunkenness)
  end

  def test_customer_can_buy_food
    assert_equal(true, @customer1.can_afford?(@food1))
  end


end
