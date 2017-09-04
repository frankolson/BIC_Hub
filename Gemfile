ruby "2.3.0"
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Default Rails Gems
gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'


# Additional Gems
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'font-awesome-rails'
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end
gem 'devise'
gem 'simple_form'
gem 'carrierwave', '~> 1.0'
source 'https://rails-assets.org' do
  gem 'rails-assets-datetimepicker'
end
gem 'acts_as_votable', '~> 0.10.0'
gem 'acts_as_commentable'
gem 'acts_as_follower', github: 'tcocca/acts_as_follower', branch: 'master'
gem 'public_activity'
gem 'will_paginate'
gem 'faker', '~> 1.6', '>= 1.6.3'


group :development, :test do
  gem 'byebug', platform: :mri
  gem 'letter_opener'
  gem 'guard'
  gem 'guard-livereload'
  gem 'guard-rspec'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
