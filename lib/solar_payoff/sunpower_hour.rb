module SolarPayoff
  class SunpowerHour < ActiveRecord::Base
    validates :start, uniqueness: true

    def kWh
      dWh / 100.0
    end
  end
end
