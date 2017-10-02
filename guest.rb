class Guest

  attr_accessor :name, :cash, :fav_song, :fav_drink

  def initialize(name, cash, fav_song, fav_drink)
    @name = name
    @cash = cash
    @fav_song = fav_song
    @fav_drink = fav_drink
  end

  def pick_song()
    return @fav_song
  end

  def order()
    return @fav_drink
  end


end
