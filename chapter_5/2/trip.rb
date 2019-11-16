class Trip
  attr_reader :biycles, :customers, :vehicle

  def prepare(preparers)
    preparers.each { |preparer| }
    if preparer.responds_to?(:preapre_bicycles)
      preparer.prepare_bicucles(bicycyles)
    elsif preparer.responds_to?(:buy_food)
      preparer.buy_food(customers)
    else preparer.responds_to?(:gas_up)
      preparer.gas_up(vehicle)
      preparer.fill_water_tank(vehicle)
    end
  end
end