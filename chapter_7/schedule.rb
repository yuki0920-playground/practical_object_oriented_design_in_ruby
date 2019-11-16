class Schedule
  def scheduled?(schedulable, start_date, end_date)
    puts "This #{schedulable.class}" +
      " is not scheduled\n" +
      "between #{start_date} and #{end_date}"
    false
  end
end

module Schedulable

  def schedule
    @schedule ||= ::Schedule.new
  end

  def schedulable?(start_date, end_date)
    !scheduled?(start_date - lead_days, end_date)
  end

  def scheduled?(start_date, end_date)
    schedule.scheduled?(self, start_date, end_date)
  end

  # 必要に応じてインクルードする側で置き換える
  def lead_days
    1
  end
end

class Bicycle
  include Schedulable

  attr_accessor :schedule, :size, :chain, :tire_size

  def initialize(args={})
    @schedule = args[:schedule] || Schedule.new
  end

  # bicycleがスケジュール可能となるまでの準備日数を返す
  def lead_days
    1
  end
end

class Vehicle
  include Schedulable

  def lead_days
    3
  end
end

class Mechanic
  include Schedulable

  def lead_days
    4
  end
end

require 'date'
starting = Date.parse("2015/09/04")
ending = Date.parse("2015/09/10")

b = Bicycle.new
b.schedulable?(starting, ending)
# This Bicycleis not scheduled
# between 2015-09-03 and 2015-09-10

v = Vehicle.new
v.schedulable?(starting, ending)
# This Vehicleis not scheduled
# between 2015-09-01 and 2015-09-10

m = Mechanic.new
m.schedulable?(starting, ending)
# This Mechanicis not scheduled
# between 2015-08-31 and 2015-09-10