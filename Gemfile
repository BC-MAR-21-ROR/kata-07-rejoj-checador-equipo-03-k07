source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false
# to use new version of bootstrap https://github.com/bootstrap-ruby/bootstrap_form/tree/bootstrap-5
# gem "bootstrap_form", git: "https://github.com/bootstrap-ruby/bootstrap_form.git", branch: "bootstrap-5"
gem "bootstrap_form", github: "bootstrap-ruby/bootstrap_form", branch: "bootstrap-5"
# devise authentication, https://github.com/heartcombo/devise
gem 'devise', '~> 4.7', '>= 4.7.3'
# https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#setup
gem "factory_bot_rails"
# https://github.com/faker-ruby/faker
gem "faker"
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use postgres as the database for Active Record
gem 'pg', '~> 1.2.3'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
# Windows Directory Monitor (WDM) is a library which can be used to monitor directories for changes.
gem 'wdm', '>= 0.1.0' if Gem.win_platform?
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 5.0'
end

group :development do
  gem 'listen', '~> 3.3'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'rubocop', '~> 1.12'
  gem 'rubocop-rails', '~> 2.9'
  gem 'rubycritic', '~> 4.6'
  gem 'rubycritic-small-badge', '~> 0.2.1'
  gem 'sandi_meter', '~> 1.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'database_cleaner-active_record', '~> 2.0'
  gem 'shoulda-matchers', '~> 4.5', '>= 4.5.1'
  gem 'selenium-webdriver'
  gem 'simplecov', '~> 0.21.2'
  gem 'simplecov-badge', '~> 2.0'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end
