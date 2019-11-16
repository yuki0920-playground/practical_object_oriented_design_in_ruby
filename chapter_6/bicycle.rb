class Bicycle
  attr_accessor :size, :tape_color

  def initialize(args)
    @size = args[:size]
    @tape_color = args[:tape_color]
  end

  # 全ての自転車は、デフォルト値として同じタイヤサイズとチェーンサイズを持つ
  def spares
    {chain: '10-speed', tire_size: '23', tape_color: tape_color}
  end

  # 他にもメソッドたくさん
end

class MouintainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
    super(args)
  end

  def spares
    super.merge(rear_shock: rear_shock)
  end
end

mountain_bike = MouintainBike.new(
  size: 'S',
  front_shock: 'Manitou',
  rear_shock: 'Fox',
)

mountain_bike.size
# -> "S"

mountain_bike.spares
# -> {:chain=>"10-speed", :tire_size=>"23", :tape_color=>nil, :rear_shock=>"Fox"}