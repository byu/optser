source 'https://rubygems.org'

# Specify your gem's dependencies in optser.gemspec
gemspec

# Development and Testing dependencies
group :development, :test do
  gem 'bundler'
  gem 'rake'

  # Requirements to run our tests and metrics and docs generation
  gem 'fuubar'
  gem 'guard'
  gem 'guard-rspec'
  gem 'rspec'
  gem 'yard'
  gem 'simplecov', require: false

  # Required to support testing
  gem 'factory_girl'

  # Required by Guard
  gem 'rb-inotify', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-fchange', require: false
end
