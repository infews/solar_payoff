require "yaml"
require "erb"
require "active_record"

include ActiveRecord::Tasks

module SolarPayoff
  module Connection
    ROOT = File.expand_path("../..", __FILE__)
    DB_CONFIGURATION = YAML.safe_load(ERB.new(IO.read(File.join(ROOT, "config/database.yml"))).result, aliases: true)
    ENV = ENV["ENV"] || "development"
  end
end

ActiveRecord::Base.configurations = SolarPayoff::Connection::DB_CONFIGURATION
ActiveRecord::Base.establish_connection(SolarPayoff::Connection::ENV.to_sym)
