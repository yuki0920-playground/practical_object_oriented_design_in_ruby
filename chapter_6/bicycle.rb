class Bicycle
  attr_accessor :style, :size, :tape_color, :front_shock, :rear_shock

  def initialize(args)
    @style = args[:style]
    @size = args[:size]
    @tape_color = args[:tape_color]
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
  end

  # 全ての自転車は、デフォルト値として同じタイヤサイズとチェーンサイズを持つ
  def spares
    if style == :road
      {chain: '10-speed', tire_size: '23', tape_color: tape_color}
    else
      {chain: '10-speed', tire_size: '2.1', rear_shock: rear_shock}
    end
  end

  # 他にもメソッドたくさん
end

bike = Bicycle.new(
  style: :mountain,
  size: 'S',
  front_shock: 'Manitou',
  rear_shock: 'Fox',
)

bike.spares
# -> {:chain=>"10-speed", :tire_size=>"2.1", :rear_shock=>"Fox"}