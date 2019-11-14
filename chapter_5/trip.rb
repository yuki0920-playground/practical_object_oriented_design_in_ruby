class Trip
  attr_reader :bicycles, :customers, :vehicle

  def prepare(preparers)
    case preparer
    when Mechanic
      prepare.parepare_bicycles(bicycles)
    when TripCoodinator
      pareparer.buy_food(customers)
    when Driver
      prepare.gas_up(vehicle)
      preparer.fill_water_tank(vehicle)
    end
  end
end

class TripCordinator
  def buy_food(customers)
    #
  end
end

class Driver
  def gas_up(vehicle)
    #
  end

  def fill_water_tank(vehicle)
    #
  end
end