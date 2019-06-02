# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.6'

gem 'active_model_serializers', '~> 0.10.0'
gem 'bootsnap', '>= 1.1.0', require: false # for booting faster
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.3'
gem 'rspec-rails', '~> 3.5'
gem 'sqlite3'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner'            # for ensuring a clean state for testing
  gem 'factory_bot_rails'           # for replacing fixtures
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', require: false     # for code quality
  gem 'spring'                      # for faster tests
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'json_spec'
  gem 'shoulda-matchers'            # for one-liner tests
  gem 'simplecov', require: false   # for checking test coverage
end
