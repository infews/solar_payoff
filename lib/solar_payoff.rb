# frozen_string_literal: true

require "sqlite3"
require_relative "../support/db_connection"
require_relative "solar_payoff/version"
require_relative "solar_payoff/pge_hour"
require_relative "solar_payoff/sunpower_hour"
require_relative "solar_payoff/pge_csv"
require_relative "solar_payoff/sunpower_xls"

module SolarPayoff
  class Error < StandardError; end
  # Your code goes here...
end
