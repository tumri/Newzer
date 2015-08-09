source 'https://rubygems.org'

ruby '2.1.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails',                   '~>4.2.1'
# WYSIWYG Editor
gem 'ckeditor',                '~>4.1.2'
# Provides authorization functionality.
gem 'pundit',                  '~>1.0.1'
# Provides file upload capability.
gem 'carrierwave',             '~>0.10.0'
# Provides cloud storage functionality.
gem 'fog',                     '~>1.32.0'
# ImageMagick integration.
gem 'mini_magick',             '~>4.2.10'
# Password Protection
gem 'bcrypt',                  '~>3.1.10'
# Faker generates fake data.
gem 'faker',                   '~>1.4.2'
# Provides hierarchy functionality.
gem 'closure_tree',            '~>5.2.0'
# Provides pagination functionality.
gem 'will_paginate',           '~>3.0.7'
# Provides pagination with Bootstrap.
gem 'bootstrap-will_paginate', '~>0.0.10'
# Bootstrap rails form builder.
gem 'bootstrap_form',          '~>2.3.0'
# Use Bootstrap in Sass format.
gem 'bootstrap-sass',          '~>3.3.4.1'
# Use SCSS for stylesheets
gem 'sass-rails',              '~>5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier',                '~>2.7.1'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails',            '~>4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails',            '~>4.0.3'
# Turbolinks makes following links in your web application faster.
gem 'turbolinks',              '~>2.5.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder',                '~>2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc',                    '~>0.4.0', group: :doc

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3',               '~>1.3.10'
  # Call 'byebug' anywhere to stop execution and get a debugger console
  gem 'byebug'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console',           '~>2.0'
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring',                '~>1.3.6'
  # Rspec
  gem 'rspec-rails',           '~>3.3.3'
end

group :test do
  gem 'minitest-reporters'
  gem 'mini_backtrace'
  gem 'guard'
  gem 'guard-minitest'
  gem 'wdm',                   '~>0.1.1' if Gem.win_platform?
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'puma'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
