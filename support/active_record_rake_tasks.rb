# Add the ability to run db:create/migrate/drop etc
# Taken from https://jer-k.github.io/add-active-record-rake-tasks-to-gem

require_relative './db_connection'
# require "yaml"
# require "erb"
# require "active_record"

include ActiveRecord::Tasks

DatabaseTasks.root = SolarPayoff::Connection::ROOT
DatabaseTasks.db_dir = File.join(DatabaseTasks.root, "db")
DatabaseTasks.migrations_paths = [File.join(DatabaseTasks.root, "db" , "migrate")]
DatabaseTasks.database_configuration = SolarPayoff::Connection::DB_CONFIGURATION
DatabaseTasks.env = SolarPayoff::Connection::ENV

load "active_record/railties/databases.rake"
