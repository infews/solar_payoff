module SolarPayoff
  class PgeHour < ActiveRecord::Base
    validates :start, uniqueness: true

    def kWh
      dWh / 100.0
    end

    def dollar_cost
      cost / 100.0
    end
  end
end
