source 'https://rubygems.org'

ruby "2.1.2"

# Gems used in every environment
gem 'sinatra',  '1.4.5', require: 'sinatra/base'
gem 'redis',    '3.1.0'
gem 'httparty', '0.13.1'
gem 'sequel',   '~> 4.14.0'
gem 'pg'
gem 'reverse_markdown', '0.5.1'
gem 'diffy', '3.0.6'
gem 'redcarpet', '3.1.2'
gem 'sequel_secure_password'


# only used in development locally
group :development, :test do
  gem 'pry',     '0.10.1'
  gem 'sinatra-contrib'
end

# gems specific just in the production environment
group :production do
end

group :test do
  gem 'rspec',    '~> 3.0.0'
  gem 'capybara', '~> 2.4.1'
  gem 'rack_session_access'
end
