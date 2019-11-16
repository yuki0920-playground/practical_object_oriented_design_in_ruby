class Trip
  attr_reader :biycles, :customers, :vehicle

  def prepare(preparers)
    preparers.each { |preparer| }
    case preparer
    when Mecanic
      preparer.prepare_bicucles(bicycyles)
    when TripCordinator
      preparer.buy_food(customers)
    when Driver
      preparer.gas_up(vehicle)
      preparer.fill_water_tank(vehicle)
    end
  end
end