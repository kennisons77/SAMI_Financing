source 'https://rubygems.org'
ruby '2.1.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.8'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin]


#added by me
gem 'fiddle', '~> 0.6.3'
gem 'devise', '~> 3.4.1'
gem 'zurb-foundation', '~> 4.3.2'
gem 'money-rails', '~> 1.3.0'
gem 'puma'

gem 'rspec-rails', '~> 3.1.0', :group => [:test, :development]
group :development do
  
  gem 'better_errors', '~> 2.1.1'
  gem 'binding_of_caller', '~> 0.7.2'
  gem 'meta_request', '~> 0.3.4' 
end

group :test do
  gem "factory_girl_rails", "~> 4.0"
  gem 'capybara', '~> 2.4.4'
  #bundle exec guard to run
  gem 'guard-rspec', '~> 4.5.0'
  gem 'wdm', '>= 0.1.0'
  gem 'faker', '~> 1.4.3'  
end

group :production do
  gem 'rails_12factor'
end 