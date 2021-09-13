# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "standard/rake"
require "./support/active_record_rake_tasks"

# Stub the :environment task for tasks like db:migrate & db:seed. Since this is a Gem we've explicitly required all
# dependent files in the needed places and we don't have to load the entire environment.
task :environment

RSpec::Core::RakeTask.new(:spec)

task default: [:"standard:fix", :spec]
