class Schedule
  def scheduled?(schedulable, start_date, end_date)
    puts "This #{schedulable.class}" +
      "is not scheduled\n" +
      "between #{start_date} and #{end_date}"
    false
  end
end

class Bicycle
  attr_accessor :schedule, :size, :chain, :tire_size

  def initialize(args={})
    @schedule = args[:schedule] || Schedule.new
  end

  # 与えられた期間の間、bicycleが利用可能であればtrueを返す
  def schedulable?(start_date, end_date)
    !scheduled?(start_date - lead_days, end_date)
  end

  # scheduleを返す
  def scheduled?(start_date, end_date)
    schedule.scheduled?(self, start_date, end_date)
  end

  # bicycleがスケジュール可能となるまでの準備日数を返す
  def lead_days
    1
  end
end

require 'date'
starting = Date.parse("2015/09/04")
ending = Date.parse("2015/09/10")

b = Bicycle.new
b.schedulable?(starting, ending)