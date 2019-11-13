class Trip
  attr_reader :bicycles, :customers, :vehicle

  # この'mechanic'引数はどんなクラスのものでも良い
  def prepare(mechanic)
    mechanic.prepare_bicycles(bicycles)
  end
end

class Mechanic
  def prepare_bicycles(bicycles)
    bycles.each{ |bicycle| prepare_bicycle(bicycle) }
  end

  def prepare_bicycles(bicycle)
    #
  end
end