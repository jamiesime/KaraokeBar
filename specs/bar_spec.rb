require 'minitest/autorun'
require 'minitest/rg'

require_relative '../bar.rb'
require_relative '../guest.rb'
require_relative '../drinks.rb'

class TestBar < MiniTest::Test

  attr_accessor :menu, :cash

  def setup()
    @menu = [
      Drinks.new("Beer", 4),
      Drinks.new("Coke", 2),
      Drinks.new("Milk", 1)
    ]

    @bar = Bar.new(@menu, 1000)
    @guest = Guest.new("Grace", 500, "MEGA", "Beer")
    @guest2 = Guest.new("Terrence", 500, "MEGA", "Weird Juice")
    @guest3 = Guest.new("Tim", 1, "MEGA", "Beer")
  end

  def test_take_order()
    initialcash = @guest.cash
    assert_equal("Beer", @bar.take_order(@guest))
    assert(@guest.cash < initialcash)
  end

  def test_take_order__not_in_stock()
    initialcash = @guest.cash
    assert_equal("We don't stock that.", @bar.take_order(@guest2))
    assert(@guest2.cash == initialcash)
  end

  def test_take_order__not_enough_cash()
    initialcash = @guest.cash
    assert_equal("You're broke, no deal.", @bar.charge(@guest3, @menu[0]))
    assert(@guest2.cash == initialcash)
  end



end
