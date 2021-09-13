# frozen_string_literal: true

require_relative "lib/solar_payoff/version"

Gem::Specification.new do |spec|
  spec.name = "solar_payoff"
  spec.version = SolarPayoff::VERSION
  spec.authors = ["Davis W. Frank"]
  spec.email = ["dwfrank@gmail.com"]

  spec.summary = "How much of my solar panels are paid off?"
  spec.description = "Uses PG&E data to determine hourly electricity rate. Uses Sunpower data to determine how many kWh generated to sell/use."
  spec.homepage = "https://github.com/infews/solar_payoff"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/infews/solar_payoff"
  spec.metadata["changelog_uri"] = "https://github.com/infews/solar_payoff/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "thor"
  spec.add_dependency "activerecord", "~> 6"
  spec.add_dependency "sqlite3"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "standard"
  spec.add_development_dependency "railties"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
