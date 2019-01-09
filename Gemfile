source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.3'
gem 'hanami-model', '~> 1.3'
gem 'surrealist',   '~> 1.3'
gem 'watir',        '~> 6.16'
gem 'moneta'

gem 'puma',         '~> 3.12.0'
gem 'dotenv',       '~> 2.4'

gem 'sqlite3'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun', platforms: :ruby
  gem 'hanami-webconsole'

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
  gem 'capybara'
end

group :production do
  # gem 'puma'
end
