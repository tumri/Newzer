source 'https://rubygems.org'

ruby '2.1.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails',                   '4.2.1'
# WYSIWYG Editor
gem 'ckeditor'                 ,github: 'galetahub/ckeditor'       # '>=4.1.2'
# Provides file upload functionality.
gem 'paperclip',               '>=4.3.0'
# Provides resource oriented interfaces and API clients for AWS services.
gem 'aws-sdk',                 '>=2.1.2'
# Password Protection
gem 'bcrypt',                  '~>3.1.10'
# Faker generates fake data.
gem 'faker',                   '>=1.4.2'
# Facilitates pagination.
gem 'will_paginate',           '>=3.0.7'
# Facilitates pagination with Bootstrap.
gem 'bootstrap-will_paginate', '>=0.0.10'
# Use Bootstrap in Sass format
gem 'bootstrap-sass',          '~>3.3.4.1'
# Use SCSS for stylesheets
gem 'sass-rails',              '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier',                '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails',            '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails',            '>= 4.0.3'
# Turbolinks makes following links in your web application faster.
gem 'turbolinks',              '>=2.5.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder',                '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc',                    '~> 0.4.0', group: :doc

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3',               '1.3.10'
  # Call 'byebug' anywhere to stop execution and get a debugger console
  gem 'byebug'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console',           '~> 2.0'
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'minitest-reporters'
  gem 'mini_backtrace'
  gem 'guard'
  gem 'guard-minitest'
  gem 'wdm',                   '>= 0.1.0' if Gem.win_platform?
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'puma'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
