module SolarPayoff
  class SunpowerHour < ActiveRecord::Base
    def kWh
      dWh / 100.0
    end
  end
end
