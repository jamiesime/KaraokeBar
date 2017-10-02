class Bar

  def initialize(menu, cash)
    @menu = menu
    @cash = cash
  end

  def take_order(guest)
    order = guest.order
    for item in @menu
      if item.name == order
        charge(guest, item)
        return order
      else
        return "We don't stock that."
      end
    end
  end

  def charge(guest, item)
    if (guest.cash > item.price)
      guest.cash -= item.price
      @cash += item.price
      return guest.cash
    else
      return "You're broke, no deal."
    end
  end

end
