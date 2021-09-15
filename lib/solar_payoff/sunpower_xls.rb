require "csv"
require "roo"

module SolarPayoff
  class SunpowerXls
    TIME_PATTERN = /^(?<hour>\d\d):(?<min>\d\d)/

    def initialize(filename)
      @filename = filename
    end

    def parse
      csv = Roo::Excelx.new(@filename).to_csv
      CSV.parse(csv)[1..].each_with_object([]) do |row, hours|
        time_with_zone = "#{row.first}-700"
        start_time = DateTime.strptime(time_with_zone, "%Y-%m-%dT%H:%M:%S%Z").to_time
        dwh = (row[1].to_f * 100).to_i
        hours << SunpowerHour.new(start: start_time, dWh: dwh) # TODO: This should be a find_or_create_by_time
      end
    end
  end
end
