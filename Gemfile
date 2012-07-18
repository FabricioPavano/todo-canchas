source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.6'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'jquery-rails'
gem 'haml'
gem 'haml-rails'
gem 'simple_form'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem "bootstrap-sass-rails"
  gem 'twitter-bootstrap-rails'

  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'thin'
end

group :test do
  gem 'rspec'
  gem 'capybara'
end

group :development do
  #solo para el rodri :)
  gem 'sqlite3' if File.open('config/database.yml').read.include? "sqlite3"
  #solo para el fabri :S
  gem 'mysql2' if File.open('config/database.yml').read.include? "mysql2"
  gem 'gem-open'
  gem 'hirb'


end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'2

# To use debugger
gem 'debugger'
