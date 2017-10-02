require 'minitest/autorun'
require 'minitest/rg'

require_relative '../bar.rb'
require_relative '../guest.rb'
require_relative '../drinks.rb'
require_relative '../song.rb'
require_relative '../room.rb'

class TestRoom < MiniTest::Test

  def setup
      @guests = [
      @guest = Guest.new("Grace", 500, "Shadow", "Beer"),
      @guest2 = Guest.new("Terrence", 500, "Buzzy Bee Song", "Bad Juice"),
      @guest3 = Guest.new("Tim", 1, @song3, "Beer")
      ]

    @songs = [
      @song1 = Song.new("Shadow", "Chromatics"),
      @song2 = Song.new("Soft Sounds From Another Planet", "Japanese Breakfast"),
      @song3 = Song.new("Regulate", "Warren G and Nate Dogg")
    ]

    @room = Room.new(@guests, @songs, 6, nil)

  end

  def test_play_song()
    @room.play_song(@guest)
    assert_equal("Shadow", @room.current_song.name)
  end

  def test_play_song__not_found()
    @room.play_song(@guest2)
    assert_equal("Regulate", @room.current_song.name)
  end

  # do the check in and out of guests next, rest of tests are passing now.

  def test_check_in()
    @new_guest = Guest.new("Bill", 20, "Regulate", "Good Juice")
    assert_equal(@new_guest.name(), @room.check_in(@new_guest))
    assert(@guests.length() > 3)
  end

  def test_check_out()
    init_length = @guests.length()
    @room.check_out(@guests[1])
    new_length = @guests.length()
    assert(init_length > new_length)
  end

  def test_charge_entry()
    assert_equal(495, @room.charge_entry(@guest))
  end

  def test_charge_entry__not_enough()
    assert_equal(1, @room.charge_entry(@guest3))
  end

end
