require 'minitest/autorun'
require 'minitest/rg'

require_relative '../guest.rb'

class TestGuest < MiniTest::Test

  def setup()
    @guest = Guest.new("Sally", 100, "Shadow", "Long Island Ice Tea")
  end

  def test_pick_song()
    assert_equal("Shadow", @guest.pick_song())
  end

  def test_order()
    assert_equal("Long Island Ice Tea", @guest.order())
  end


end
