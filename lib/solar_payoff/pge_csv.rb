require "csv"

module SolarPayoff
  class PgeCsv
    TIME_PATTERN = /^(?<hour>\d\d):(?<min>\d\d)/

    def initialize(filename)
      @filename = filename
    end

    def parse
      get_intervals
        .group_by { |interval| interval[:time] }
        .each_with_object([]) do |(time, intervals), hours|
        usage = (sum(intervals, :usage) * 100).to_i
        cost = (sum(intervals, :cost) * 100).to_i
        hours << PgeHour.new(start: time, dWh: usage, cost: cost) # TODO: This should be a find_or_create_by_time
      end
    end

    private

    def sum(intervals, sym)
      intervals.sum { |interval| interval[sym] }
    end

    # The PG&E CSV file has some account stuff at the beginning, then has the CSV headers.
    # So this method goes line-by-line through the file until it gets to the first data line
    # in the CSV table, *then* it pulls the data into an Array of Hashes of the important data
    def get_intervals
      CSV.foreach(@filename).each_with_object([]) do |line, intervals|
        next unless /^Electric usage/.match?(line.first.to_s)

        intervals << {
          time: time_from(line[1], line[2]),
          usage: line[4].to_f,
          cost: cost_from(line[6])
        }
      end
    end

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
