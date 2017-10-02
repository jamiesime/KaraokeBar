class Room

  attr_accessor :guests, :songs, :capacity, :current_song

  def initialize(guests, songs, capacity, current_song)
    @guests = guests
    @songs = songs
    @capacity = capacity
    @current_song = current_song
  end

  def play_song(guest)
    for song in @songs
      if song.name == guest.pick_song()
        @current_song = song
        return @current_song.name
      end
    end
    @current_song = @songs.last()
    puts "Not found! Maybe you'll like this instead..."
    return @current_song.name
  end

  def check_in(new_guest)
    if @guests.length < @capacity
      @guests << new_guest
    else
      puts "Sorry, this room is already full!"
    end
    return new_guest.name()
  end

  def check_out(departing)
    @guests.delete(departing)
  end

  def charge_entry(new_guest)
    if (new_guest.cash > 5)
      new_guest.cash -= 5
      return new_guest.cash()
    else
      puts "Sorry, you don't have enough money to come in."
      return new_guest.cash()
    end
  end



end
