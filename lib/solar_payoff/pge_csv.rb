require "csv"

module SolarPayoff
  class PgeCsv
    TIME_PATTERN = /^(?<hour>\d\d):(?<min>\d\d)/
    def initialize(filename)
      @filename = filename
    end

    def parse
      table = CSV.parse(File.read(@filename), headers: true)
      intervals = table.map do |row|
        {
          time: time_from(row["DATE"], row["START TIME"]),
          usage: row["USAGE"].to_f,
          cost: cost_from(row["COST"])
        }
      end
      intervals.group_by { |i| i[:time] }
        .each_with_object([]) do |(time, intervals), hours|
        usage = (intervals.sum { |i| i[:usage] } * 100).to_i
        cost = (intervals.sum { |i| i[:cost] } * 100).to_i
        hours << PgeHour.new(start: time, dWh: usage, cost: cost)
      end
    end

    private

    def cost_from(cost_s)
      cost_s.sub("$", "").to_f
    end

    def time_from(date_s, start_s)
      time = Date.parse(date_s).to_time

      match = start_s.match(TIME_PATTERN)
      hour = match[:hour].to_i
      (time + (hour * 3600)).to_time
    end
  end
end
