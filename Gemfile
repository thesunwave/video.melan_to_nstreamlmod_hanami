source 'https://rubygems.org'

gem 'rake'
gem 'hanami', '~> 1.3', '>= 1.3.0'
gem 'hanami-model', '~> 1.3'
gem 'surrealist',   '~> 1.3'
gem 'watir', '~> 6.16', '>= 6.16.5'
gem 'cachy'
gem 'redis'

gem 'puma', '~> 3.12.6'
gem 'dotenv',       '~> 2.4'
gem 'rest-client'
gem "nokogiri", ">= 1.11.0"

gem 'sqlite3'

gem "sentry-raven"

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun', '>= 0.9.2', platforms: :ruby
  gem 'hanami-webconsole', '>= 0.1.0'

  gem 'capistrano', '~> 3.11', require: false
  gem 'capistrano-rvm'
  gem 'capistrano-bundler', '~> 1.3'
  gem 'capistrano3-puma', github: "seuros/capistrano-puma"
end

group :test, :development do
  gem 'pry-byebug'
  gem 'pry'
end

group :test do
  gem 'rspec'
  gem 'capybara', '>= 3.31.0'
end
