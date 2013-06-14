source 'https://rubygems.org'

gem 'rails', '3.2.8'
#gem 'rake', '10.0.4' 

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

#gem 'sqlite3'
gem 'mysql2', :group => [:development, :test]
gem "paperclip", "~> 3.0"
gem 'debugger'
gem 'stamp'
gem 'russian', '~> 0.6.0'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

group :production do
  gem  'activerecord-postgresql-adapter'	
  gem 'pg'#, '0.12.2'
end


  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'passenger'
gem 'will_paginate'

group :test do
 gem "factory_girl_rails", '~> 1.7.0'
end	



# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
