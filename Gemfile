source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# For Rails
gem 'rails', '~> 5.2.0'

# For reducing boot times through caching, required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# For Puma as the app server
gem 'puma', '~> 3.11'

# For aborting HTTP requests that take too long
gem 'rack-timeout'

# For PostgreSQL
gem 'pg'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# For generating random, realistic-looking test data, e.g. addresses, emails
gem 'faker'

# For debugging, for printing Ruby objects in friendlier format
gem 'awesome_print'

# For parsing/generating JSON within Ruby
gem 'json'

# For serializing objects
gem 'active_model_serializers'

# For pagination of results of any kind
gem 'will_paginate', '~> 3.0'

group :development, :test do

  # For running tests
  gem 'rspec-rails', '~> 3.9'

  # For Ruby debugging, call 'byebug' anywhere in the code to stop execution and
  # get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

end

group :development do

  # For browser, required by Rails Panel Chrome extension
  gem 'meta_request'

  # For auto-reloading of browser window when view files change
  gem 'rack-livereload'

  # For enhanced display of server-side exceptions in browser
  gem 'better_errors', '~> 2.8'

  # For IRB console on error pages
  gem 'web-console', '~> 3.6'

  gem 'listen'

end

group :test do

  # For generating test models populated with fake data, used in running tests
  gem 'fabrication'

  # For resetting db between tests
  gem 'database_cleaner'

end
