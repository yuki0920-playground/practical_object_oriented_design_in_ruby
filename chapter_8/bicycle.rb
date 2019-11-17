require 'pry'

class Bicycle
  attr_reader :size, :parts

  def initialize(args={})
    @size = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end
end

class Parts < Bicycle
  attr_accessor :chain, :tire_size

  def initialize(args={})
    @chain = args[:chain] || default_chain
    @tire_size = args[:tire_size] || default_tire_size
    post_initialize(args) # Bicycleでは送信と
  end

  def post_initialize(args) # 実装の両方を行う
    nil
  end

  def default_chain
    '10-speed'
  end

  def default_tire_size
    raise NotImplementedError,
      "This #{self.class} cannot respond to."
  end

  def spares
    {tire_size: tire_size, chain: chain}.merge(local_spares)
  end

  # サブクラスがオーバーライドするためのフック
  def local_spares
    {}
  end
end

class RoadBikeParts < Parts
  attr_accessor :tape_color

  def post_initialize(args)
    @tape_color = args[:tape_color]
  end

  def local_spares
    {tape_color: tape_color}
  end

  def default_tire_size
    '23'
  end
end

class MountainBikeParts < Parts
  attr_reader :front_shock, :rear_shock

  def post_initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
  end

  def local_spares
    {rear_schock: rear_shock}
  end

  def default_tire_size
    '2.1'
  end
end

road_bike = Bicycle.new(
  size: 'L',
  parts: RoadBikeParts.new(tape_color: 'red'))

p road_bike.size
# -> "L"
p road_bike.spares
# -> {:tire_size=>"23", :chain=>"10-speed", :tape_color=>"red"}

mountain_bike = Bicycle.new(
  size: 'L',
  parts: MountainBikeParts.new(rear_shock: 'Fox'))

p mountain_bike.size
# -> "L"
p mountain_bike.spares
# -> {:tire_size=>"2.1", :chain=>"10-speed", :rear_schock=>"Fox"}